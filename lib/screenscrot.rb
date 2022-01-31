# frozen_string_literal: true

require_relative 'screenscrot/version'

##
# Capture screenshots with SCROT and create .gif animation
#
class ScreenScrot
  attr_accessor :title, :ext, :path, :directory, :frames

  alias extension ext
  alias dir directory

  ##
  # Set default configuration for title, image extension and path directory.
  #
  class << self
    attr_accessor :title, :path, :ext

    def configure
      init
      yield(ScreenScrot) if block_given?
      return true if title && path && ext

      false
    end

    alias config configure
    alias setup configure

    private

    def init
      @title ||= 'ScreenScrot'
      @path ||= Dir.pwd
      @ext ||= 'png'
      true
    end
  end

  ##
  # @example
  #   screen = ScreenScrot.new 'title', 'path_to_dir', 'image_extension'
  # @return [ScreenScrot] ScreenScrot instance object.
  #
  def initialize(title = nil, path = nil, ext = nil)
    ScreenScrot.configure
    @frames = 0
    @title = title || ScreenScrot.title
    @path = path || ScreenScrot.path
    @ext = ext || ScreenScrot.ext
    [@title, @path, @ext].select do |type|
      raise 'Configuration data must be string!' unless type.is_a?(String)
    end
    @path += '/' unless @path.end_with?('/')
    @filename = "#{@title}_#{rand(999)}"
    @directory =  "#{@path}#{@filename}/"
    system "mkdir -p #{@directory}" unless Dir.exist?(@directory)
    Dir.chdir(@directory)
  end

  ##
  # Capture screenshot with `SCROT`
  #
  # @example Capture active window (default)
  #   screen.capture
  #
  # @example Capture all screen
  #   screen.capture :all
  #
  # @example Capture selected with mouse
  #   screen.capture :select
  #
  def capture(win = :active, quality: 75)
    scr = case win.to_sym
          when :all
            ''    # rec everything
          when :select
            '-s'  # select with mouse
          else
            '-u' # active window (default)
          end
    screenshot = @directory + Time.now.to_f.to_s.gsub!('.', '')
    exec = "scrot #{scr} -q #{quality} #{screenshot + @frames.to_s}.#{@ext}"
    system exec
    # captured frames counter
    @frames += 1
  end

  def to_gif(title = nil, opts = {})
    title ||= @filename
    opts[:dir]   ||= @directory
    opts[:ext]   ||= @ext
    opts[:delay] ||= 20
    opts[:loop]  ||= 2
    Dir.chdir(opts[:dir])
    title += '.gif' unless title.end_with? '.gif'
    exec = "convert -delay #{opts[:delay]} -loop #{opts[:loop]} *.#{opts[:ext]} #{title}"
    system exec
  rescue StandardError => e
    puts e.message
    false
  end
end

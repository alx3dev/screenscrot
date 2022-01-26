# frozen_string_literal: true

require_relative './spec_helper'

RSpec.describe ScreenScrot do
  context ScreenScrot.new do
    let(:title) { 'ScreenScrot_TEST' }
    let(:path) { '/home/' }
    let(:ext) { 'jpeg' }

    it 'has title configured on empty initialisation' do
      expect(ScreenScrot.title).not_to be nil
      expect(ScreenScrot.title).to eq 'ScreenScrot'
    end

    it 'has path configured on empty initialisation' do
      expect(ScreenScrot.path).not_to be nil
    end

    it 'has extension configured on empty initialisation' do
      expect(ScreenScrot.ext).not_to be nil
      expect(ScreenScrot.ext).to eq 'png'
    end

    it 'remove empty test directory' do
      working_dir = Dir.pwd
      Dir.chdir('..')
      removed = Dir.rmdir(working_dir)
      expect(removed).to eq 0
    end
  end
end

RSpec.describe ScreenScrot do
  context ScreenScrot.config do
    let(:title) { 'ScreenScrot_TEST' }
    let(:path) { Dir.pwd }
    let(:ext) { 'jpeg' }

    it 'init empty configuration, call block and attribute setters' do
      # accept configuration block
      ScreenScrot.setup do |ss|
        ss.title = title
        ss.path = path
        ss.ext = ext
      end

      # expect config is same as test-default
      expect(ScreenScrot.title).to eq title
      expect(ScreenScrot.path).to eq path
      expect(ScreenScrot.ext).to eq ext

      # accept setter methods
      ScreenScrot.title = 'new title'
      ScreenScrot.path = "/home/#{`whoami`.chomp}"
      ScreenScrot.ext = 'png'

      # expect config is not same as test-default
      expect(ScreenScrot.title).not_to eq title
      expect(ScreenScrot.path).not_to eq path
      expect(ScreenScrot.ext).not_to eq ext
    end
  end
end

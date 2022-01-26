# frozen_string_literal: true

require 'rspec'
require_relative '../lib/screenscrot'

RSpec.configure do |config|
  config.example_status_persistence_file_path = "#{Dir.pwd}/.rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

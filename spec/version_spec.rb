# frozen_string_literal: true

require_relative './spec_helper'

RSpec.describe ScreenScrot do
  context ScreenScrot::VERSION do
    it 'has a version number' do
      expect(ScreenScrot::VERSION).not_to be nil
    end
  end
end

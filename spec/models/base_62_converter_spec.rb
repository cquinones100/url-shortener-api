require 'rails_helper'
require './app/models/base_62_converter.rb'

RSpec.describe 'base 62 converter' do
  describe 'when given an integer' do
    it 'converts the integer to its base62 string' do
      expect(Base62Converter.new(integer: 125).convert).to eq('21')
      expect(Base62Converter.new(integer: 7912).convert).to eq('23c')
      expect(Base62Converter.new(integer: 1).convert).to eq(1)
    end

    it 'converts a base62 string to an integer', focus: true do
      expect(Base62Converter.new(string: '1').convert).to eq(1)
      expect(Base62Converter.new(string: '21').convert).to eq(125)
      expect(Base62Converter.new(string: 'c').convert).to eq(38)
      expect(Base62Converter.new(string: '23c').convert).to eq(7912)
    end
  end
end

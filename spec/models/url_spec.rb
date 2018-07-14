require 'rails_helper'

RSpec.describe Url, type: :model do
  describe '.build_url' do
    it 'instantiates a url object' do
      expect(Url.build_url(url: 'google.com')).to be_an_instance_of(Url)
    end
  end

  describe 'validating format' do
    it 'rejects an url that does not pass validation' do
      original_url = 'http://www.hhh'

      url = Url.new(original_url: original_url)

      expect(url.save).to eq(false)
    end

    it 'allows a url in the right format' do
      original_url = 'http://www.hhh.com'

      url = Url.new(original_url: original_url)

      expect(url.save).to eq(true)
    end
  end
end

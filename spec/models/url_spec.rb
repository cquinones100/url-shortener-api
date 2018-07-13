require 'rails_helper'

RSpec.describe Url, type: :model do
  describe '.build_url' do
    it 'instantiates a url object' do
      expect(Url.build_url(url: 'google.com')).to be_an_instance_of(Url)
    end
  end
end

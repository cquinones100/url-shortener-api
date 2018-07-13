require './app/models/url_sanitizer.rb'

RSpec.describe 'url sanitizer' do
  describe 'when the url is missing "http://www."' do
    it 'adds the prefix' do
      url = 'google.com'

      expect(UrlSanitizer.new(url: url).sanitize).to eq('http://www.google.com')

      url = 'www.google.com'

      expect(UrlSanitizer.new(url: url).sanitize).to eq('http://www.google.com')

      url = 'http://google.com'

      expect(UrlSanitizer.new(url: url).sanitize).to eq('http://www.google.com')
    end
  end
end

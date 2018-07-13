require 'rails_helper'

RSpec.describe 'creating urls', type: :request do
  before(:each) do
    Url.all.each(&:destroy)
  end
  describe 'when visiting to a valid url' do
    it 'redirects to the url' do
      Url.create(original_url: 'http://google.com', url: '1', id: 1)

      get '/1/', xhr: true

      expect(response).to have_http_status(302)
    end

    it 'redirects to the url' do
      Url.create(original_url: 'http://www.google.com', url: '1', id: 1)

      get '/1/', xhr: true

      expect(JSON.parse(response.body)["url"]).to eq('http://www.google.com')
    end
  end

  describe 'when visiting an invalid url' do
    it 'returns the home page' do
      get '/1'

      expect(response).to redirect_to '/'
    end
  end
end

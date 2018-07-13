require 'rails_helper'

RSpec.describe 'creating urls', type: :request do
  describe 'when posting to a valid url' do
    it 'returns a 201' do
      params = { url: { original_url: 'google.com' } }

      post '/urls', params: params

      expect(response).to have_http_status(201)
    end
  end

  describe 'when a url is already taken' do
    it 'returns a 422' do
      Url.create(original_url: 'http://www.google.com')

      params = { url: { original_url: 'google.com' } }

      post '/urls', params: params

      expect(response).to have_http_status(422)
    end
  end
end

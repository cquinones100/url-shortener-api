require 'rails_helper'

RSpec.describe 'accessing the top 100 urls', type: :request do
  it 'returns the top 100 urls' do
    Url.all.each(&:destroy)

    (1..110).each do |index|
      Url.create(original_url: "http://www.#{index}.com", id: index, view_count: index)
    end

    get '/urls?order=view_count&direction=desc', xhr: true

    expect(JSON.parse(response.body).length).to eq(100)
  end
end

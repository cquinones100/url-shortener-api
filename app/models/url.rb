require './app/models/base_62_converter.rb'

class Url < ApplicationRecord
  validates :original_url, uniqueness: true

  def self.build_url(url:)
    id = find_last_url_id + 1

    Url.new(
      id: id, 
      original_url: self.sanitize_original_url(url), 
      url: self.create_short_url(id)
    )
  end

  private

  def self.find_last_url_id
    Url.last.id rescue 0
  end

  def self.sanitize_original_url(url)
    UrlSanitizer.new(url: url).sanitize
  end

  def self.create_short_url(id)
    Base62Converter.new(integer: id).convert
  end
end

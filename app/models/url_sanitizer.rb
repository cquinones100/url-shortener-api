class UrlSanitizer
  def initialize(url:)
    @url = url
  end

  def sanitize
    "http://www.#{@url.gsub(/https?:\/\/|www\./, '')}"
  end
end

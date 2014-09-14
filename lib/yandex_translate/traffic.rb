module YandexTranslate
  include ::HTTParty

  class TrafficError < StandardError; end

  class Traffic
    YANDEX_URL = 'https://translate.yandex.net/api/v1.5/tr.json/translate'

    attr_accessor :api_key, :from, :to, :text, :format

    def initialize(api_key, from = "en", to = "es", text)
      @api_key  = api_key
      @from     = from
      @to       = to
      @text     = text
      @format   = 'json'
    end

    def get
      ::HTTParty.get(build_url)
    end

  private

    def build_url
      query = {key: @api_key, lang: build_language, text: URI.encode(@text), format: @format.to_s}
      "#{YANDEX_URL}?#{query.keys.map{|k| "#{k}=#{query[k]}"}.join("&")}"
    end

    def build_language
      "#{@from}-#{@to}"
    end
  end
end
module YandexTranslate
  class TranslationError < StandardError; end

  class Translate
    class << self
      def translate(api_key, from = 'en', to = 'es', text)
        parse(::YandexTranslate::Traffic.new(
                api_key,
                from,
                to,
                text
              ).get)
      end

    private

      def parse(hash)
        code = hash['code']

        case code
        when 401 then raise ::YandexTranslate::TrafficError.new('Invalid API key')
        when 402 then raise ::YandexTranslate::TrafficError.new('This API key has been blocked')
        when 403 then raise ::YandexTranslate::TrafficError.new('You have reached the daily limit for requests')
        when 404 then raise ::YandexTranslate::TrafficError.new('You have reached the daily limit for the volume of translated text')
        when 413 then raise ::YandexTranslate::TranslationError.new('The text size exceeds the maximum')
        when 422 then raise ::YandexTranslate::TranslationError.new('The text could not be translated')
        when 501 then raise ::YandexTranslate::TranslationError.new('The specified translation direction is not supported')
        when 200
          return  hash['text'].first
        end
      end
    end
  end
end
module YandexTranslate
  def self.translate(api_key, from = 'en', to = 'es', text)
    YandexTranslate::Translate.translate(api_key, from, to, text)
  end
end

require 'yandex_translate/traffic'
require 'yandex_translate/translate'
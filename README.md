# Yandex Translate

[Yandex](http://www.yandex.com/) offers cheap/free translations through an API.

This gem offers a easy way to translate text between two languages.


## Setup

### Bundle

In your  Gemfile add:
```
gem 'httparty'
gem 'yandex_translate', github: 'riencroonenborghs/yandex_translate'
```

and
```
bundle install
```


### API Key
Get a key [here](http://api.yandex.com/key/form.xml?service=trnsl)

It's limited to like 1M chars a day or so.


## Usage
```
YandexTranslate.translate('secret', 'en', 'es, 'your text')
```
Will translate 'your text', using your 'secret' api key, from English to Spanish.
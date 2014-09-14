$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "yandex_translate/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "yandex_translate"
  s.version     = YandexTranslate::VERSION
  s.authors     = ["Rien Croonenborghs"]
  s.email       = ["rien@croonenborghs.net"]
  s.homepage    = "http://github.com/riencroonenborghs/yandex_translate"
  s.summary     = "Gem for translations through Yandex"
  s.description = "Gem for translations through Yandex"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency("httparty")
end

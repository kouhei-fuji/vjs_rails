# encoding: utf-8
$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'vjs_rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'vjs_rails'
  s.version     = VjsRails::VERSION
  s.authors     = ['Kouhei Fujigaya']
  s.email       = ['kouhei.fujigaya@gmail.com']
  s.homepage    = 'https://github.com/kouhei-fuji/vjs_rails'
  s.summary     = 'Video.js for Rails.'
  s.description = 'VjsRails is for using Video.js in Rails applications.'
  s.licenses    = ['MIT']

  s.files = Dir['{lib,app}/**/*', 'vendor/assets/**/*', 'MIT-LICENSE', 'README.md']

  s.add_dependency 'railties', '>= 4.0.2'
end

# -*- encoding: utf-8 -*-
require File.expand_path('../lib/soul_catcher/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'soul_catcher'
  spec.version       = SoulCatcher::VERSION
  spec.authors       = ['sidney sissaoui']
  spec.email         = ['shideneyu@gmail.com']
  spec.version     	 = '0.0.1'
  spec.date          = '2014-03-14'
  spec.summary       = 'Soul Catcher enables us to watch and get connected clients mac addresses.'
  spec.description   = 'Soul Catcher is a solution to get unlimited internet access when using a captive portal.'
  spec.license       = 'MIT'
  spec.homepage      = 'https://github.com/shideneyu/soul-catcher'
  spec.files         = `git ls-files`.split($\)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_development_dependency 'digest'
  spec.add_development_dependency 'highline'
  spec.add_development_dependency 'ruby-progressbar'
  spec.add_development_dependency 'choice'
  spec.add_development_dependency 'formatador'
  spec.add_development_dependency 'pry'
end

# -*- encoding: utf-8 -*-
# stub: pwa 4.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "pwa".freeze
  s.version = "4.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jonas H\u00FCbotter".freeze]
  s.date = "2019-12-22"
  s.description = "Add a service worker and a manifest to your app, for it to be recognized as a PWA and accessed without a network connection.".freeze
  s.email = "me@jonhue.me".freeze
  s.homepage = "https://github.com/jonhue/pwa".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.4.19".freeze
  s.summary = "Progressive Web Apps for Rails".freeze

  s.installed_by_version = "3.4.19" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<mozaic>.freeze, ["~> 2.0"])
  s.add_runtime_dependency(%q<railties>.freeze, [">= 5.0"])
  s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
  s.add_development_dependency(%q<rubocop-rspec>.freeze, [">= 0"])
end

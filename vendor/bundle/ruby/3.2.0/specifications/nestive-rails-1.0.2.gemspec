# -*- encoding: utf-8 -*-
# stub: nestive-rails 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "nestive-rails".freeze
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jonas H\u00FCbotter".freeze, "Justin French".freeze, "Pavel Pravosud".freeze]
  s.date = "2019-12-20"
  s.description = "A Better Nested Inheritable Layouts Plugin for Rails 5".freeze
  s.email = ["jonas.huebotter@gmail.com".freeze, "justin@indent.com.au".freeze, "pavel@pravosud.com".freeze]
  s.homepage = "https://github.com/jonhue/nestive-rails".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.4.19".freeze
  s.summary = "A Better Nested Inheritable Layouts Plugin for Rails 5".freeze

  s.installed_by_version = "3.4.19" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<actionview>.freeze, [">= 5.0"])
  s.add_runtime_dependency(%q<railties>.freeze, [">= 5.0"])
  s.add_development_dependency(%q<rspec>.freeze, ["~> 3.7"])
  s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.52"])
end

# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/i18n-js/version'

Gem::Specification.new do |gem|
  gem.name          = "guard-i18n-js"
  gem.version       = Guard::I18nJSVersion::VERSION
  gem.authors       = ["Dingding Ye"]
  gem.email         = ["yedingding@gmail.com"]
  gem.homepage    = 'http://rubygems.org/gems/guard-i18n-js'
  gem.description   = %q{Guard::I18nJS automatically export your i18n js transations when needed}
  gem.summary       = %q{Guard gem for i18n-js}

  gem.required_rubygems_version = '>= 1.3.6'
  gem.rubyforge_project         = 'guard-i18n-js'

  gem.add_dependency 'guard',   '~> 1.1'
  gem.add_dependency 'i18n-js', '~> 3.0.0.rc3'

  gem.add_development_dependency 'rspec',       '~> 2.6'
  gem.add_development_dependency 'guard-rspec', '~> 1.0'

  gem.files         = Dir.glob('{lib}/**/*') + %w[LICENSE README.md]
  gem.require_paths = ["lib"]

  gem.rdoc_options = ["--charset=UTF-8", "--main=README.md", "--exclude='(lib|test|spec)|(Gem|Guard|Rake)file'"]
end

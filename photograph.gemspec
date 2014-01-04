# -*- encoding: utf-8 -*-
require File.expand_path('../lib/photograph/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["JH. Chabran"]
  gem.email         = ["jh@chabran.fr"]
  gem.description   = %q{Ruby gem that screenshots any url}
  gem.summary       = %q{Ruby gem that screenshots any url}
  gem.homepage      = "https://github.com/jhchabran/photograph"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "photograph"
  gem.require_paths = ["lib"]
  gem.version       = Photograph::VERSION

  gem.add_dependency 'poltergeist'
  gem.add_dependency 'mini_magick'

  gem.add_development_dependency 'rspec', '~> 2.14'
  gem.add_development_dependency 'rake'

  gem.post_install_message = 'DEPRECATION: Artist#shoot! cannot be used without a block anymore. Please check your code, thank you.'
end

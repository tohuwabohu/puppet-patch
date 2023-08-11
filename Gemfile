source ENV['GEM_SOURCE'] || 'https://rubygems.org'

group :development, :test do
  gem 'rake', '~> 12.0'
  gem 'rspec', '~> 3.5'
  gem 'rspec-puppet', '~> 2.4'
  gem 'puppetlabs_spec_helper', '~> 2.3'
  gem 'puppet-blacksmith', '~> 3.4'
  gem 'puppet-lint', '~> 2.0'
  gem 'metadata-json-lint', '~> 2.0.1'
  gem 'puppet-lint-absolute_classname-check', '~> 0.1'
  gem 'puppet-lint-unquoted_string-check', '~> 0.2'
  gem 'puppet-syntax', '~> 2.1'
end

group :ruby_19_compatibility do
  gem 'json_pure', '~> 1.8'
  gem 'rest-client', '~> 1.8'
end

group :system_tests do
  gem 'beaker', '~> 3.20'
  gem 'beaker-puppet_install_helper', '~> 0.5'
  gem 'beaker-rspec', '~> 6.1'
  gem 'serverspec', '~> 2.31'
end

if puppetversion = ENV['PUPPET_VERSION']
  gem 'puppet', puppetversion
else
  gem 'puppet', '~> 7.0'
end

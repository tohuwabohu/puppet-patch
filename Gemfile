source ENV['GEM_SOURCE'] || 'https://rubygems.org'

group :development, :test do
  gem 'rake', '~> 11.1.1'
  gem 'rspec', '~> 3.4.0'
  gem 'rspec-puppet', '~> 2.4.0'
  gem 'puppetlabs_spec_helper', '~> 1.1.1'
  gem 'puppet-blacksmith', '~> 3.3.1'
  gem 'puppet-lint', '~> 1.1.0'
  gem 'metadata-json-lint', '~> 0.0.11'
  gem 'puppet-lint-absolute_classname-check', '~> 0.1.3'
  gem 'puppet-lint-unquoted_string-check', '~> 0.2.5'
  gem 'puppet-syntax', '~> 2.1.0'

  gem 'rest-client', '~> 1.8'  # Ruby 1.9.2 compatible
end

group :system_tests do
  gem 'beaker', '~> 2.37.0'
  gem 'beaker-rspec', '~> 5.3.0'
  gem 'serverspec', '~> 2.31.0'
end

if puppetversion = ENV['PUPPET_VERSION']
  gem 'puppet', puppetversion
else
  gem 'puppet', '~> 4.4.0'
end

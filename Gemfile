source ENV['GEM_SOURCE'] || 'https://rubygems.org'

group :development, :test do
  gem 'rake', '~> 10.4.2'
  gem 'rspec', '~> 3.4.0'
  gem 'rspec-puppet', '~> 2.3.0'
  gem 'puppetlabs_spec_helper', '~> 1.0.1'
  gem 'puppet-lint', '~> 1.1.0'
  gem 'puppet-syntax', '~> 2.0.0'
end

if puppetversion = ENV['PUPPET_VERSION']
  gem 'puppet', puppetversion
else
  gem 'puppet', '~> 3.8.3'
end

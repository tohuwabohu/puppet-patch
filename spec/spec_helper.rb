require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |c|
  c.default_facts = {
    :os => {
      name: 'Debian',
    },
    :puppet_vardir   => '/var/lib/puppet'
  }
end

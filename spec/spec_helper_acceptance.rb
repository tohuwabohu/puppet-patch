require 'beaker-rspec/spec_helper'
require 'beaker/puppet_install_helper'

if default.name =~ /ubuntu.*1604.*/
  # https://tickets.puppetlabs.com/browse/BKR-821
  run_puppet_install_helper(type='agent')
else
  run_puppet_install_helper
end

RSpec.configure do |c|
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  c.formatter = :documentation
  c.before :suite do
    puppet_module_install(:source => proj_root, :module_name => 'patch')
    hosts.each do |host|
      on host, puppet('module', 'install', 'puppetlabs-stdlib', '--version 4.12.0')
    end
  end
end

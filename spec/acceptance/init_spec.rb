require 'spec_helper_acceptance'

describe 'by default' do
  let(:manifest) { "class { 'patch': }" }

  specify 'should provision with no errors' do
    apply_manifest(manifest, :catch_failures => true)
  end

  specify 'should be idempotent' do
    apply_manifest(manifest, :catch_changes => true)
  end
end

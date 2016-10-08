require 'spec_helper_acceptance'

describe 'patch::file' do
  before(:all) {
    shell('echo "changeme" > /tmp/file1')
  }

  describe 'with diff_content' do
    let(:diff_content) { <<-EOS
1c1
< changeme
---
> changed
      EOS
    }

    let(:manifest) { "patch::file { '/tmp/file1': diff_content => '#{diff_content}' }" }

    specify 'should provision with no errors' do
      apply_manifest(manifest, :catch_failures => true)
    end

    specify 'should be idempotent' do
      apply_manifest(manifest, :catch_changes => true)
    end

    describe file('/tmp/file1') do
      its(:content) { should match /changed/ }
    end
  end
end

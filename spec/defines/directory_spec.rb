require 'spec_helper'

describe 'patch::directory' do
  let(:facts) { {:puppet_vardir => '/var'} }

  describe 'by default' do
    let(:title) { 'example' }
    let(:params) { {:cwd => '/path/to/target', :diff_content => 'content'} }

    it { should contain_file('/var/patch/1a79a4d60de6718e8e5b326e338ae533.patch').with_content('content') }
  end

  describe 'by default' do
    let(:title) { 'example' }
    let(:params) { {:cwd => '/path/to/target', :diff_source => '/path/to/patch'} }

    it { should contain_file('/var/patch/1a79a4d60de6718e8e5b326e338ae533.patch').with_source('/path/to/patch') }
  end

  describe 'with prefix' do
    let(:title) { 'example' }
    let(:params) { {:diff_source => '/path/to/patch', :prefix => '0001', :cwd => '/path/to/target'} }

    it { should contain_file('/var/patch/0001-1a79a4d60de6718e8e5b326e338ae533.patch').with_source('/path/to/patch') }
  end
end

require 'spec_helper'

describe 'patch::file' do
  let(:facts) { {:puppet_vardir => '/var'} }

  describe 'by default' do
    let(:title) { 'example' }
    let(:params) { {:target => '/path/to/target', :diff_content => 'content'} }

    it { should contain_file('/var/patch/643b4ca76866ea58b26b6bdc1d0eb4fe.patch').with_content('content') }
  end

  describe 'by default' do
    let(:title) { 'example' }
    let(:params) { {:target => '/path/to/target', :diff_source => '/path/to/patch'} }

    it { should contain_file('/var/patch/643b4ca76866ea58b26b6bdc1d0eb4fe.patch').with_source('/path/to/patch') }
  end

  describe 'with target as title' do
    let(:title) { '/path/to/target' }
    let(:params) { {:diff_source => '/path/to/patch'} }

    it { should contain_file('/var/patch/643b4ca76866ea58b26b6bdc1d0eb4fe.patch').with_source('/path/to/patch') }
  end

  describe 'with prefix' do
    let(:title) { '/path/to/target' }
    let(:params) { {:diff_source => '/path/to/patch', :prefix => '0001'} }

    it { should contain_file('/var/patch/0001-643b4ca76866ea58b26b6bdc1d0eb4fe.patch').with_source('/path/to/patch') }
  end
end

require 'spec_helper'

describe Rexpense::Http do
  subject { Rexpense::Http.new('8cd049b4afca9213fb2455528394ab2fb0bc34f5c905f33c') }

  describe '#get' do
    let(:http_method) { :get }
    let(:url) { '/organizations/68/tags' }
    let(:params) { {} }

    it_behaves_like 'available http request methods'
  end

  describe '#post' do
    let(:http_method) { :post }
    let(:url) { '/organizations/68/tags' }
    let(:params) { { name: 'Rexpense gem client' } }

    it_behaves_like 'available http request methods'
  end

  describe '#put' do
    let(:http_method) { :put }
    let(:url) { '/organizations/68/tags/172' }
    let(:params) { { name: 'Rexpense gem client 02' } }

    it_behaves_like 'available http request methods'
  end

  describe '#delete' do
    let(:http_method) { :delete }
    let(:url) { '/organizations/68/tags/114' }
    let(:params) { {} }

    it_behaves_like 'available http request methods'
  end
end

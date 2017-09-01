require 'spec_helper'

describe Rexpense::Http do
  subject { Rexpense::Http.new('8cd049b4afca9213fb2455528394ab2fb0bc34f5c905f33c') }

  describe '#get' do
    let(:http_method) { :get }
    let(:url) { '/api/v1/organizations' }
    let(:params) { {} }

    it_behaves_like 'available http request methods'
  end

  describe '#post' do
    let(:http_method) { :post }
    let(:url) { '/api/v1/expenses' }
    let(:params) { { entity: { name: 'Second entity' } } }

    it_behaves_like 'available http request methods'
  end

  describe '#put' do
    let(:http_method) { :put }
    let(:url) { '/api/v1/expenses/948' }
    let(:params) { { entity: { name: 'Second updated entity' } } }

    it_behaves_like 'available http request methods'
  end

  describe '#delete' do
    let(:http_method) { :delete }
    let(:url) { '/api/v1/expenses/247' }
    let(:params) { {} }

    it_behaves_like 'available http request methods'
  end
end

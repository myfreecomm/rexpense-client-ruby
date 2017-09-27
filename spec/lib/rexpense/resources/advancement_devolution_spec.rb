require 'spec_helper'

describe Rexpense::Resources::AdvancementDevolution, vcr: true do
  let(:devolution_klass) { Rexpense::Entities::AdvancementDevolution }

  describe "#create" do
    let(:params) do
      {
        payer_id: 35, receiver_id: 2, amount: 10.10,
        currency: 'BRL', date: '27/09/2017'
      }
    end


    it 'create a new devolution' do
      result = client.advancement_devolutions.create(params)
      expect(result).to be_a(devolution_klass)
      expect(result.amount).to eq(10.10)
    end

    context "with error" do
      it "raises Rexpense::RequestError with 422 status code" do
        expect { client.advancement_devolutions.create({}) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end
end

require "spec_helper"

describe Rexpense::Client do
  subject { client }

  shared_examples :resource do |method, type|
    describe "##{method}" do
      it "instantiates a new #{type}" do
        allow(type).to receive(:new)
        subject.send(method)
        expect(type).to have_received(:new).with(subject.http)
      end
    end
  end

  describe "#initialize" do
    it "instantiates a new Rexpense::Http object" do
      expect(Rexpense::Http).to receive(:new).with("abc")
      Rexpense::Client.new("abc")
    end

    context "when account_id is present" do
      it "instantiates a new Rexpense::Http object" do
        expect(Rexpense::Http).to receive(:new).with("abc")
        Rexpense::Client.new("abc")
      end
    end
  end

  describe "#authenticated?" do
    context "with a valid token" do
      it "returns true" do
        VCR.use_cassette("client/authenticated/true") { expect(subject.authenticated?).to be_truthy }
      end
    end

    context "with an invalid token" do
      subject { described_class.new("FAKE-TOKEN") }

      it "returns false" do
        VCR.use_cassette("client/authenticated/false") { expect(subject.authenticated?).to be_falsey }
      end
    end
  end

  # include_examples :resource, :entities, Rexpense::Resources::Entity
end

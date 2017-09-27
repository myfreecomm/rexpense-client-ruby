require 'spec_helper'

describe Rexpense::Resources::Webhook, vcr: true do
  let(:devolution_klass) { Rexpense::Entities::Webhook }

  describe "#find_all" do
    context "with success" do
      subject { client.webhooks.find_all }

      it "show all webhooks successfully" do
        expect(subject.class).to eq(Rexpense::Entities::WebhookCollection)
        expect(subject.collection.first.class).to eq(webhook_klass)
      end
    end
  end

  describe "#find" do
    subject { client.webhooks.find }
  end

  describe "#create" do
    subject { client.webhooks.create }
  end

  describe "#update" do
    subject { client.webhooks.update }
  end

  describe "#destroy" do
    subject { client.webhooks.destroy }
  end
end

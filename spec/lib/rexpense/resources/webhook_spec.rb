require 'spec_helper'

describe Rexpense::Resources::Webhook, vcr: true do
  let(:webhook_klass) { Rexpense::Entities::Webhook }

  describe "#find_all" do
    context "with success" do
      subject { client.webhooks.find_all(35) }

      it "show all webhooks successfully" do
        expect(subject.class).to eq(Rexpense::Entities::WebhookCollection)
        expect(subject.collection.first.class).to eq(webhook_klass)
      end
    end
  end

  describe "#find" do
    subject { client.webhooks.find(35, 2) }

    it "returns a category successfully" do
      expect(subject.class).to eq(webhook_klass)
      expect(subject.id).to eq(2)
    end
  end

  describe "#create" do
    subject { client.webhooks.create(35, { url: 'https://requestb.in/uxd48yux' }) }

    it "returns a category successfully" do
      expect(subject.class).to eq(webhook_klass)
      expect(subject.url).to eq('https://requestb.in/uxd48yux')
    end
  end

  describe "#update" do
    subject { client.webhooks.update(35, 4, { description: 'foobar' }) }

    it "returns a category successfully" do
      expect(subject.class).to eq(webhook_klass)
      expect(subject.description).to eq('foobar')
    end
  end

  describe "#destroy" do
    subject { client.webhooks.destroy(35, 2) }

    it "destroy a webhook successfully" do
      expect(subject).to be_truthy
    end
  end
end

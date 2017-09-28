require 'spec_helper'

describe Rexpense::Resources::Advancement, vcr: true do
  let(:advancement_klass) { Rexpense::Entities::Advancement }

  describe "#find_all" do
    context "with success" do
      subject { client.advancements.find_all }

      it "show all advancements successfully" do
        expect(subject.class).to eq(Rexpense::Entities::AdvancementCollection)
        expect(subject.collection.first.class).to eq(advancement_klass)
      end
    end

    it "find advancements by attributes" do
      params = { currency_in: ["USD"] }
      result = client.advancements.find_all(params)

      expect(result).to be_a(Rexpense::Entities::AdvancementCollection)
      expect(result.collection[0]).to be_a(advancement_klass)
      expect(result.collection[0].currency).to eq("USD")
      expect(result.collection[1].currency).to eq("USD")
      expect(result.collection[2].currency).to eq("USD")
    end

    context "when error" do
      let(:client) { Rexpense.client("") }

      it "raises Rexpense::RequestError with 401 status code" do
        expect { client.advancements.find_all({}) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(401)
        end
      end
    end
  end

  describe "#find" do
    context "with success" do
      subject { client.advancements.find(40) }

      it "returns a category successfully" do
        expect(subject.class).to eq(advancement_klass)
        expect(subject.id).to eq(40)
      end
    end

    context "with error" do
      it "raises Rexpense::RequestError with 404 status code" do
        expect { client.advancements.find(000000) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end
    end
  end

  describe "#create" do
    let(:params) do
      {
        amount: 129.65,
        date: '2017-09-04',
        payer: {
          id: 144,
          type: 'Organization'
        },
        receiver: {
          id: 2,
          type: 'User'
        }
      }
    end

    context "with success" do
      it "creates a category successfully" do
        result = client.advancements.create(params)
        expect(result).to be_a(advancement_klass)
        expect(result.amount).to eq(129.65)
      end
    end

    context "with error" do
      it "raises Rexpense::RequestError with 422 status code" do
        expect { client.advancements.create({}) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe "#update" do
    context "with success" do
      it "updates a category successfully" do
        expect(client.advancements.update(40, { amount: 152.00 })).to be_a(advancement_klass)
      end
    end

    context "with error" do
      it "raises Rexpense::RequestError with 404 status code" do
        expect { client.advancements.update(88888888, {}) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end

      it "raises Rexpense::RequestError with 422 status core" do
        expect { client.advancements.update(40, { date: '' }) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe "#destroy" do
    context "with success" do
      it "destroy a category successfully" do
        expect(client.advancements.destroy(52)).to be_truthy
      end
    end

    context "with error" do
      it "raises Rexpense::RequestError with 404 status code" do
        expect { client.advancements.destroy(88888888) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end
    end
  end

  context 'Comments' do
  end

  context 'Participants' do
    let(:user_klass) { Rexpense::Entities::User }

    describe "#participants" do
      context "with success" do
        subject { client.advancements.participants(51) }

        it "show all advancements successfully" do
          expect(subject.class).to eq(Rexpense::Entities::UserCollection)
          expect(subject.collection.first.class).to eq(user_klass)
        end
      end
    end

    describe '#leave_participant' do
      subject { client.advancements.leave_participant(49) }

        it "show all advancements successfully" do
          expect(subject).to be_truthy
        end
    end
  end
end

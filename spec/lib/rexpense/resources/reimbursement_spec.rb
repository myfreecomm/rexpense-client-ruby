require 'spec_helper'

describe Rexpense::Resources::Reimbursement, vcr: true do
  let(:reimbursement_klass) { Rexpense::Entities::Reimbursement }

  describe "#find_all" do
    context "with success" do
      subject { client.reimbursements.find_all }

      it "show all reimbursements successfully" do
        expect(subject.class).to eq(Rexpense::Entities::ReimbursementCollection)
        expect(subject.collection.first.class).to eq(reimbursement_klass)
      end
    end

    it "find reimbursements by attributes" do
      params = { currency_in: ["USD"] }
      result = client.reimbursements.find_all(params)

      expect(result).to be_a(Rexpense::Entities::ReimbursementCollection)
      expect(result.collection[0]).to be_a(reimbursement_klass)
      expect(result.collection[0].currency).to eq("USD")
    end

    context "when error" do
      let(:client) { Rexpense.client("") }

      it "raises Rexpense::RequestError with 401 status code" do
        expect { client.reimbursements.find_all({}) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(401)
        end
      end
    end
  end

  describe "#find" do
    context "with success" do
      subject { client.reimbursements.find(51) }

      it "returns a category successfully" do
        expect(subject.class).to eq(reimbursement_klass)
        expect(subject.id).to eq(51)
      end
    end

    context "with error" do
      it "raises Rexpense::RequestError with 404 status code" do
        expect { client.reimbursements.find(000000) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end
    end
  end

  describe "#create" do
    let(:params) do
      {
        amount: 10.0,
        expense_ids: [241],
        currency: 'BRL',
        date: '2014-10-16',
        payer: {
          id: 16,
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
        result = client.reimbursements.create(params)
        expect(result).to be_a(reimbursement_klass)
        expect(result.amount).to eq(10.0)
      end
    end

    context "with error" do
      it "raises Rexpense::RequestError with 422 status code" do
        expect { client.reimbursements.create({}) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe "#update" do
    context "with success" do
      it "updates a category successfully" do
        expect(client.reimbursements.update(78, { description: 'something from nothing' })).to be_a(reimbursement_klass)
      end
    end

    context "with error" do
      it "raises Rexpense::RequestError with 404 status code" do
        expect { client.reimbursements.update(88888888, {}) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end

      it "raises Rexpense::RequestError with 422 status core" do
        expect { client.reimbursements.update(78, { payer_id: nil }) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe "#destroy" do
    context "with success" do
      it "destroy a category successfully" do
        expect(client.reimbursements.destroy(78)).to be_truthy
      end
    end

    context "with error" do
      it "raises Rexpense::RequestError with 404 status code" do
        expect { client.reimbursements.destroy(88888888) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end
    end
  end

  context 'Comments' do
    let(:comment_klass) { Rexpense::Entities::Comment }

    describe '#comments' do
      context "with success" do
        subject { client.reimbursements.comments(11) }

        it "show all reimbursement successfully" do
          expect(subject.class).to eq(Rexpense::Entities::CommentCollection)
          expect(subject.collection.first.class).to eq(comment_klass)
        end
      end
    end

    describe '#find_comment' do
      context "with success" do
        subject { client.reimbursements.find_comment(11, 287) }

        it "show a reimbursement comment successfully" do
          expect(subject.class).to eq(comment_klass)
          expect(subject.id).to eq(287)
        end
      end
    end

    describe '#create_comment' do
      context "with success" do
        subject { client.reimbursements.create_comment(72, { content: 'Loren ipsun dollor' }) }

        it "create a comment" do
          expect(subject.class).to eq(comment_klass)
          expect(subject.id).to eq(678)
        end
      end
    end

    describe '#update_comment' do
      context "with success" do
        subject { client.reimbursements.update_comment(72, 678, { content: 'Foo bar' }) }

        it "update comment" do
          expect(subject.class).to eq(comment_klass)
          expect(subject.id).to eq(678)
          expect(subject.content).to eq('Foo bar')
        end
      end
    end

    describe '#destroy_comment' do
      subject { client.reimbursements.destroy_comment(72, 678) }

      it "destroy comment" do
        expect(subject).to be_truthy
      end
    end
  end

  context 'Participants' do
    let(:user_klass) { Rexpense::Entities::User }

    describe "#participants" do
      context "with success" do
        subject { client.reimbursements.participants(70) }

        it "show all reimbursements successfully" do
          expect(subject.class).to eq(Rexpense::Entities::UserCollection)
          expect(subject.collection.first.class).to eq(user_klass)
        end
      end
    end

    describe '#leave_participant' do
      subject { client.reimbursements.leave_participant(51) }

        it "show all reimbursements successfully" do
          expect(subject).to be_truthy
        end
    end
  end
end

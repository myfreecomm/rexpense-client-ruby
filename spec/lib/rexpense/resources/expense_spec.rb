require 'spec_helper'

describe Rexpense::Resources::Expense, vcr: true do
  let(:expense_klass) { Rexpense::Entities::Expense }

  describe "#find_all" do
    context "with success" do
      subject { client.expenses.find_all }

      it "show all expenses successfully" do
        expect(subject.class).to eq(Rexpense::Entities::ExpenseCollection)
        expect(subject.collection.first.class).to eq(expense_klass)
      end
    end

    context "when error" do
      let(:client) { Rexpense.client("") }

      it "raises Rexpense::RequestError with 401 status code" do
        expect { client.expenses.find_all({}) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(401)
        end
      end
    end
  end

  describe "#find" do
    context "with success" do
      subject { client.expenses.find(949) }

      it "returns a category successfully" do
        expect(subject.class).to eq(expense_klass)
        expect(subject.id).to eq(949)
      end
    end

    context "with error" do
      it "raises Rexpense::RequestError with 404 status code" do
        expect { client.expenses.find(000000) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end
    end
  end

  describe "#create" do
    let(:params) do
      {
        amount: 129.65,
        kind: 'monetary',
        occurred_at: '2017-09-04',
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
        result = client.expenses.create(params)
        expect(result).to be_a(expense_klass)
        expect(result.amount).to eq(129.65)
      end
    end

    context "with error" do
      it "raises Rexpense::RequestError with 422 status code" do
        expect { client.expenses.create({}) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe "#update" do
    context "with success" do
      it "updates a category successfully" do
        expect(client.expenses.update(949, { amount: 152.00 })).to be_a(expense_klass)
      end
    end

    context "with error" do
      it "raises Rexpense::RequestError with 404 status code" do
        expect { client.expenses.update(88888888, {}) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end

      it "raises Rexpense::RequestError with 422 status core" do
        expect { client.expenses.update(949, { occurred_at: '' }) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe "#destroy" do
    context "with success" do
      it "destroy a category successfully" do
        expect(client.expenses.destroy(949)).to be_truthy
      end
    end

    context "with error" do
      it "raises Rexpense::RequestError with 404 status code" do
        expect { client.expenses.destroy(88888888) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end
    end
  end

  context 'Comments' do
    let(:comment_klass) { Rexpense::Entities::Comment }

    describe '#comments' do
      context "with success" do
        subject { client.expenses.comments(808) }

        it "show all expense comments successfully" do
          expect(subject.class).to eq(Rexpense::Entities::CommentCollection)
          expect(subject.collection.first.class).to eq(comment_klass)
        end
      end
    end

    describe '#find_comment' do
      context "with success" do
        subject { client.expenses.find_comment(808, 654) }

        it "show a expense comment successfully" do
          expect(subject.class).to eq(comment_klass)
          expect(subject.id).to eq(654)
        end
      end
    end

    describe '#create_comment' do
      context "with success" do
        subject { client.expenses.create_comment(808, { content: 'Loren ipsun dollor' }) }

        it "create a comment" do
          expect(subject.class).to eq(comment_klass)
          expect(subject.id).to eq(679)
        end
      end
    end

    describe '#update_comment' do
      context "with success" do
        subject { client.expenses.update_comment(808, 679, { content: 'Foo bar' }) }

        it "update comment" do
          expect(subject.class).to eq(comment_klass)
          expect(subject.id).to eq(679)
          expect(subject.content).to eq('Foo bar')
        end
      end
    end

    describe '#destroy_comment' do
      subject { client.expenses.destroy_comment(808, 679) }

      it "destroy comment" do
        expect(subject).to be_truthy
      end
    end
  end

  context 'Participants' do
    let(:user_klass) { Rexpense::Entities::User }

    describe "#participants" do
      context "with success" do
        subject { client.expenses.participants(973) }

        it "show all expenses successfully" do
          expect(subject.class).to eq(Rexpense::Entities::UserCollection)
          expect(subject.collection.first.class).to eq(user_klass)
        end
      end
    end

    describe '#leave_participant' do
      subject { client.expenses.leave_participant(940) }

        it "show all expenses successfully" do
          expect(subject).to be_truthy
        end
    end
  end

  context 'Attachments' do
    let(:attachment_klass) { Rexpense::Entities::Attachment }

    describe '#attachments' do
      subject { client.expenses.attachments(974) }

      it 'return expenses attachments' do
        expect(subject.class).to eq(Rexpense::Entities::AttachmentCollection)
        expect(subject.collection.first.class).to eq(attachment_klass)
      end
    end

    describe '#find_attachments' do
      subject { client.expenses.find_attachment(974, 635) }

      it 'return attachment' do
        expect(subject.class).to eq(Rexpense::Entities::Attachment)
        expect(subject.id).to eq(635)
      end
    end

    describe '#destroy_attachments' do
      subject { client.expenses.destroy_attachment(974, 635) }

      it 'destroy attachment' do
        expect(subject).to be_truthy
      end
    end
  end
end

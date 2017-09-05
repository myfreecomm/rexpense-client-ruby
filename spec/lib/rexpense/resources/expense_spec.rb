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

    it "find expenses by attributes" do
      params = { kind_in: ["distance"] }
      result = client.expenses.find_all(params)

      expect(result).to be_a(Rexpense::Entities::ExpenseCollection)
      expect(result.collection[0]).to be_a(expense_klass)
      expect(result.collection[0].kind).to eq("distance")
      expect(result.collection[1].kind).to eq("distance")
      expect(result.collection[2].kind).to eq("distance")
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
end

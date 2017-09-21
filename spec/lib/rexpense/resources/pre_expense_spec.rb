require 'spec_helper'

describe Rexpense::Resources::PreExpense, vcr: true do
  let(:pre_expense_klass) { Rexpense::Entities::PreExpense }

  describe "#find_all" do
    context "with success" do
      subject { client.pre_expenses.find_all }

      it "show all pre_expenses successfully" do
        expect(subject.class).to eq(Rexpense::Entities::PreExpenseCollection)
        expect(subject.collection.first.class).to eq(pre_expense_klass)
      end
    end

    context "when error" do
      let(:client) { Rexpense.client("") }

      it "raises Rexpense::RequestError with 401 status code" do
        expect { client.pre_expenses.find_all({}) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(401)
        end
      end
    end
  end

  describe "#ignore" do
    context "with success" do
      it "ignore a pre_expense" do
        result = client.pre_expenses.ignore(4)
        expect(result.ignored_at).to_not be_nil
      end
    end
  end

  describe "#restore" do
    context "with success" do
      it "restore a pre_expense" do
        result = client.pre_expenses.restore(4)
        expect(result.ignored_at).to be_nil
      end
    end
  end

  describe "#convert" do
    let(:params) do
      { amount: 129.65, currency: 'BRL', payer_id: 35, liquidate_through_advancement: 0 }
    end

    context "with success" do
      it "creates a category successfully" do
        result = client.pre_expenses.convert(2, params)
        expect(result).to be_a(Rexpense::Entities::Expense)
        expect(result.amount).to eq(129.65)
        expect(result.pre_expense_id).to eq(2)
      end
    end

    context "with error" do
      it "raises Rexpense::RequestError with 422 status code" do
        expect { client.pre_expenses.convert(3, {}) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe "#destroy" do
    context "with success" do
      it "destroy a category successfully" do
        expect(client.pre_expenses.destroy(3)).to be_truthy
      end
    end

    context "with error" do
      it "raises Rexpense::RequestError with 404 status code" do
        expect { client.pre_expenses.destroy(88888888) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end
    end
  end
end

require 'spec_helper'

describe Rexpense::Resources::Organization, vcr: true do
  let(:organization_klass) { Rexpense::Entities::Organization }

  describe "#find_all" do
    context "with success" do
      subject { client.organizations.find_all }

      it "show all organizations successfully" do
        expect(subject.class).to eq(Rexpense::Entities::OrganizationCollection)
        expect(subject.collection.first.class).to eq(organization_klass)
      end
    end

    context "when error" do
      let(:client) { Rexpense.client("") }

      it "raises Rexpense::RequestError with 401 status code" do
        expect { client.organizations.find_all({}) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(401)
        end
      end
    end
  end

  describe "#find" do
    context "with success" do
      subject { client.organizations.find(35) }

      it "returns a category successfully" do
        expect(subject.class).to eq(organization_klass)
        expect(subject.id).to eq(35)
      end
    end

    context "with error" do
      it "raises Rexpense::RequestError with 404 status code" do
        expect { client.organizations.find(000000) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end
    end
  end

  describe "#update" do
    context "with success" do
      it "updates a organization name successfully" do
        expect(client.organizations.update(16, { name: "Game of words" })).to be_a(organization_klass)
      end
    end

    context "with error" do
      it "raises Rexpense::RequestError with 404 status code" do
        expect { client.organizations.update(88888888, {}) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end

      it "raises Rexpense::RequestError with 422 status core" do
        expect { client.organizations.update(16, { name: '' }) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe "#destroy" do
    context "with success" do
      it "destroy a category successfully" do
        expect(client.organizations.destroy(14)).to be_truthy
      end
    end

    context "with error" do
      it "raises Rexpense::RequestError with 404 status code" do
        expect { client.organizations.destroy(88888888) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(404)
        end
      end
    end
  end

  context 'Tags' do
  end
end

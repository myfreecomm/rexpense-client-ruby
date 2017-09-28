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

  describe '#distances_rules' do
    subject { client.organizations.distances_rules(35) }

    it 'return organization distance rule' do
      expect(subject).to eq({
        'id' => 3,
        'amount' => 6.0,
        'currency' => 'BRL',
        'distance_kind' => 'km',
        'organization_id' => 35
      })
    end
  end

  describe '#update_distances_rules' do
    subject { client.organizations.update_distances_rules(35, { amount: 7.0 }) }

    it 'return organization distance rule' do
      expect(subject).to eq({
        'id' => 3,
        'amount' => 7.0,
        'currency' => 'BRL',
        'distance_kind' => 'km',
        'organization_id' => 35
      })
    end
  end

  context 'Memberships' do
    let(:membership_klass) { Rexpense::Entities::Membership }

    describe '#memberships' do
      subject { client.organizations.memberships(35) }

      it 'returns a collection of memberships' do
        expect(subject.class).to eq(Rexpense::Entities::MembershipCollection)
        expect(subject.collection.first.class).to eq(membership_klass)
      end
    end

    describe '#find_membership' do
      subject { client.organizations.find_membership(35, 64) }

      it 'find a membership in organization' do
        expect(subject.class).to eq(Rexpense::Entities::Membership)
        expect(subject.user.id).to eq(64)
      end
    end

    describe '#create_membership' do
      subject { client.organizations.create_membership(35, { user: { email: 'dante.miranda@nexaas.com' }, role: 'member' }) }

      it 'create a membership in organization' do
        expect(subject).to eq({
          "total_recipients" => 1,
          "not_added_recipients" => [],
          "added_recipients" => ["dante.miranda@nexaas.com"],
          "invalid_recipients" => []
        })
      end
    end

    describe '#update_membership' do
      subject { client.organizations.update_membership(35, 64, { role: 'admin' }) }

      it 'update a membership' do
        expect(subject.role).to eq('admin')
      end
    end

    describe '#destroy_membership' do
      subject { client.organizations.destroy_membership(35, 64) }

      it 'update a membership' do
        expect(subject).to be_truthy
      end
    end
  end
end

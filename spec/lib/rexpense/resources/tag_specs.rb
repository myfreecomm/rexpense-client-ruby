require 'spec_helper'

describe Rexpense::Resources::Tag, vcr: true do
  let(:tag_klass) { Rexpense::Entities::Tag }

  describe '#find_all' do
    subject { client.tags.find_all(35) }

    it "show all tags successfully" do
      expect(subject.class).to eq(Rexpense::Entities::TagCollection)
      expect(subject.collection.first.class).to eq(tag_klass)
    end

    context "when error" do
      let(:client) { Rexpense.client("") }

      it "raises Rexpense::RequestError with 401 status code" do
        expect { client.tags.find_all(35) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(401)
        end
      end
    end
  end

  describe '#find' do
    subject { client.tags.find(35, 64) }

    it "returns a category successfully" do
      expect(subject.class).to eq(tag_klass)
      expect(subject.id).to eq(64)
    end
  end

  describe '#create' do
    subject { client.tags.create(35, { name: 'teste gem 2' }) }

    it "returns a category successfully" do
      expect(subject.class).to eq(tag_klass)
      expect(subject.name).to eq('teste gem 2')
    end

    context "with error" do
      it "raises Rexpense::RequestError with 422 status core" do
        expect { client.tags.create(35, { name: '' }) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe '#update' do
    subject { client.tags.update(35, 64, { name: 'updated tag' }) }

    it "returns a category successfully" do
      expect(subject.class).to eq(tag_klass)
      expect(subject.name).to eq('updated tag')
    end

    context "with error" do
      it "raises Rexpense::RequestError with 422 status core" do
        expect { client.tags.update(35, 64, { name: '' }) }.to raise_error(Rexpense::RequestError) do |error|
          expect(error.code).to eq(422)
        end
      end
    end
  end

  describe '#destroy' do
    subject { client.tags.destroy(35, 90) }

    context "with success" do
      it "destroy a category successfully" do
        expect(subject).to be_truthy
      end
    end
  end
end

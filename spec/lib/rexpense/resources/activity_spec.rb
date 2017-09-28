require 'spec_helper'

describe Rexpense::Resources::Activity, vcr: true do
  let(:activity_klass) { Rexpense::Entities::Activity }

  describe "#find_all" do
    context "with success" do
      subject { client.activities.find_all }

      it "show all activities successfully" do
        expect(subject.class).to eq(Rexpense::Entities::ActivityCollection)
        expect(subject.collection.first.class).to eq(activity_klass)
      end
    end
  end
end

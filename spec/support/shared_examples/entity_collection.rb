shared_examples :entity_collection do |entity_type|
  let(:params) { double(headers: {}, parsed_body: [{}]) }

  subject { described_class.new(params) }

  context "#build" do
    it "returns a collection(#{described_class})" do
      expect(subject.build).to be_a(described_class)
    end
  end

  context "#collection" do
    before :each do
      subject.build
    end

    it "returns items(#{entity_type})" do
      expect(subject.collection).to all(be_a(entity_type))
    end
  end
end

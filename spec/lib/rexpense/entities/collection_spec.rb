require 'spec_helper'

describe Rexpense::Entities::Collection do
  let(:response) { double(headers: {"Link" => "<https://sandbox.rexpense.com/api/v1/expenses?page=3>; rel=next, <https://sandbox.rexpense.com/api/v1/expenses?page=1>; rel=prev, <https://sandbox.rexpense.com/api/v1/expenses?page=3>; rel=last, <https://sandbox.rexpense.com/api/v1/expenses?page=1>; rel=first" },
                          body: "[]") }

  subject { described_class.new(response) }

  describe '#build' do
    it 'raises NotImplementedError' do
      expect { subject.build }.to raise_error(NotImplementedError)
    end
  end

  describe '#next_page' do
    it 'returns next page (3)' do
      expect(subject.next_page).to eq(3)
    end

    context 'when there is no next page' do
      let(:response) { double(headers: {"Link" => ""}, body: "") }

      it 'returns nil' do
        expect(subject.next_page).to be_nil
      end
    end
  end

  describe '#last_page' do
    it 'returns last page (3)' do
      expect(subject.last_page).to eq(3)
    end

    context 'when there is no last page' do
      let(:response) { double(headers: {"Link" => ""}, body: "") }

      it 'returns nil' do
        expect(subject.last_page).to be_nil
      end
    end
  end

  describe '#previous_page' do
    it 'returns previous page (3)' do
      expect(subject.previous_page).to eq(1)
    end

    context 'when there is no previous page' do
      let(:response) { double(headers: {"Link" => ""}, body: "") }

      it 'returns nil' do
        expect(subject.previous_page).to be_nil
      end
    end
  end

  describe '#first_page' do
    it 'returns first page (3)' do
      expect(subject.first_page).to eq(1)
    end

    context 'when there is no first page' do
      let(:response) { double(headers: {"Link" => ""}, body: "") }

      it 'returns nil' do
        expect(subject.first_page).to be_nil
      end
    end
  end
end

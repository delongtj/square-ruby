require 'spec_helper'

describe Square::Fee do
  subject { Square::Fee }
  it_behaves_like 'a listable resource'
  it_behaves_like 'a creatable resource'
  it_behaves_like 'an updatable resource'
  it_behaves_like 'a deletable resource'
  it_behaves_like 'a retrievable resource'

  describe '.apply' do
    before do
      allow(Square).to receive(:make_request) { |*args| args.first }
      allow(Square).to receive(:parse_response) { |*args| args.first[:payload] }
    end

    it 'should raise an error when called with the wrong arguments' do
      expect { subject.apply }.to raise_error ArgumentError
      expect { subject.apply('item-id') }.to raise_error ArgumentError
      expect { subject.apply('item-id', 'fee-id') }.not_to raise_error
    end

    it 'should apply a fee' do
      item_id = 'item-id'
      fee_id = 'fee-id'
      params = {}

      item = subject.apply(item_id, fee_id)
      expect(item).to be_a Square::DataTypes::Item

      expect(Square).to have_received(:make_request) do |request|
        expect(request[:method]).to eq 'PUT'
        expect(request[:endpoint]).to eq File.join 'items', item_id, 'fees', fee_id
        expect(request[:payload]).to be_nil
        expect(request[:params]).to be_nil

        # Assign the request back to params so we can test that parse_response
        # got the arguments we expect.
        params = request
      end

      expect(Square).to have_received(:parse_response) do |response|
        expect(response).to eq params
      end
    end
  end

  describe '.remove' do
    before do
      allow(Square).to receive(:make_request) { |*args| args.first }
      allow(Square).to receive(:parse_response) { |*args| args.first[:payload] }
    end

    it 'should raise an error when called with the wrong arguments' do
      expect { subject.remove }.to raise_error ArgumentError
      expect { subject.remove('item-id') }.to raise_error ArgumentError
      expect { subject.remove('item-id', 'fee-id') }.not_to raise_error
    end

    it 'should apply a fee' do
      item_id = 'item-id'
      fee_id = 'fee-id'
      params = {}

      item = subject.remove(item_id, fee_id)
      expect(item).to be_a Square::DataTypes::Item

      expect(Square).to have_received(:make_request) do |request|
        expect(request[:method]).to eq 'DELETE'
        expect(request[:endpoint]).to eq File.join 'items', item_id, 'fees', fee_id
        expect(request[:payload]).to be_nil
        expect(request[:params]).to be_nil

        # Assign the request back to params so we can test that parse_response
        # got the arguments we expect.
        params = request
      end

      expect(Square).to have_received(:parse_response) do |response|
        expect(response).to eq params
      end
    end
  end
end

require 'spec_helper'

RSpec.describe Event, type: :model do
  describe '::KNOWN_TYPES' do
    specify { expect(described_class::KNOWN_TYPES).to eq(['button_press']) }
  end

  describe '#event_type' do
    context 'when it references an unknown type' do
      before { subject.event_type = 'unknown' }

      it 'is invalid' do
        subject.valid?
        expect(subject.errors).to include(:event_type)
      end
    end

    context 'when it references a known type' do
      before { subject.event_type = described_class::KNOWN_TYPES.sample }

      it 'is valid' do
        subject.valid?
        expect(subject.errors).not_to include(:event_type)
      end
    end
  end

  describe '#button_mac_address' do
    context 'when is has no value' do
      before { subject.button_mac_address = [nil, ''].sample }

      it 'is invalid' do
        subject.valid?
        expect(subject.errors).to include(:button_mac_address)
      end
    end

    context 'when is has a value' do
      before { subject.button_mac_address = 'some value' }

      it 'is valid' do
        subject.valid?
        expect(subject.errors).not_to include(:button_mac_address)
      end
    end
  end
end

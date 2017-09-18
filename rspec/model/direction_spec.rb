require_relative '../../model/direction'

RSpec.describe Direction do
  describe '#is_a_direction?' do
    subject { Direction.is_a_direction?(direction) }

    context 'with valid direction' do
      %w(North EAST SOUTH west).each do |direct|
        let(:direction) { direct }

        it { is_expected.to be true }
      end
    end

    context 'with invalid direction' do
      let(:direction) { 'foo' }

      it { is_expected.to be false }
    end
  end

  describe '#rotate_left' do
    subject { Direction.rotate_left(direction) }

    context 'with valid direction' do
      let(:direction) { 'North' }

      it { is_expected.to eq 'WEST' }
    end

    context 'with invalid direction' do
      let(:direction) { 'foo' }

      it { is_expected.to be nil }
    end
  end

  describe '#rotate_right' do
    subject { Direction.rotate_right(direction) }

    context 'with valid direction' do
      let(:direction) { 'esT' }

      it { is_expected.to eq 'SOUTH' }
    end

    context 'with invalid direction' do
      let(:direction) { 'foo' }

      it { is_expected.to be nil }
    end
  end
end
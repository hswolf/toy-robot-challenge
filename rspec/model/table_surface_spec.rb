require_relative '../../model/table_surface'

RSpec.describe TableSurface do
  describe '#position_is_inside?' do
    table_surface = TableSurface.new(5, 5)
    subject { table_surface.position_is_inside?(position) }

    context 'with position inside table surface' do
      let(:position) { Position.new(0, 1) }

      it { is_expected.to eq true }
    end

    context 'with position outside table surface' do
      let(:position) { Position.new(4, 5) }

      it { is_expected.to eq false }
    end

    context 'with invalid position' do
      let(:position) { 'foo' }

      it 'should raise error' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end
end
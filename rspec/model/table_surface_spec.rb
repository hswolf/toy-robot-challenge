require_relative '../../model/table_surface'

RSpec.describe TableSurface do
  describe '#inside_table_surface?' do
    table_surface = TableSurface.new(5, 5)
    subject { table_surface.inside_table_surface?(position) }

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
        expect { table_surface.inside_table_surface?(position) }.to raise_error(ArgumentError)
      end
    end
  end
end
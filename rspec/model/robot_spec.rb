require_relative '../../model/robot'
require_relative '../../model/table_surface'

RSpec.describe Position do
  table_surface = TableSurface.new(5, 5)
  robot = Robot.new(table_surface)

  describe '#place' do
    subject { robot.place(x, y, direction) }

    context 'with valid parameters' do
      let(:x) { 1 }
      let(:y) { 2 }
      let(:direction) { 'WEST' }

      before { subject }

      it 'should generate appropriate data of robot' do
        expect(robot.position.x).to eq 1
        expect(robot.position.y).to eq 2
        expect(robot.direction).to eq 'WEST'
      end
    end

    context 'with invalid parameters' do
      context 'invalid position' do
        let(:x) { 'foo' }
        let(:y) { 'bar' }
        let(:direction) { 'WEST' }

        it 'should raise error' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end

      context 'position is outside of playground' do
        let(:x) { 5 }
        let(:y) { 0 }
        let(:direction) { 'WEST' }

        it 'should not change any data of robot' do
          expect(robot.position.x).to eq 1
          expect(robot.position.y).to eq 2
          expect(robot.direction).to eq 'WEST'
        end
      end

      context 'invalid direction' do
        let(:x) { 0 }
        let(:y) { 0 }
        let(:direction) { 'WESTTT' }

        it 'should not change any data of robot' do
          expect(robot.position.x).to eq 1
          expect(robot.position.y).to eq 2
          expect(robot.direction).to eq 'WEST'
        end
      end
    end
  end
end
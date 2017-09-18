require_relative '../../model/robot'
require_relative '../../model/table_surface'

RSpec.describe Position do
  describe '#place' do
    before(:all) do
      table_surface = TableSurface.new(5, 5)
      @robot = Robot.new(table_surface)
    end

    subject { @robot.place(x, y, direction) }

    context 'with valid parameters' do
      let(:x) { 1 }
      let(:y) { 2 }
      let(:direction) { 'WEST' }

      before { subject }

      it 'should generate appropriate data of robot' do
        expect(@robot.position.x).to eq 1
        expect(@robot.position.y).to eq 2
        expect(@robot.direction).to eq 'WEST'
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

        before { subject }

        it 'should not change any data of robot' do
          expect(@robot.position.x).to eq 1
          expect(@robot.position.y).to eq 2
          expect(@robot.direction).to eq 'WEST'
        end
      end

      context 'invalid direction' do
        let(:x) { 0 }
        let(:y) { 0 }
        let(:direction) { 'WESTTT' }

        before { subject }

        it 'should not change any data of robot' do
          expect(@robot.position.x).to eq 1
          expect(@robot.position.y).to eq 2
          expect(@robot.direction).to eq 'WEST'
        end
      end
    end
  end

  describe '#move' do
    before(:each) do
      table_surface = TableSurface.new(5, 5)
      @robot = Robot.new(table_surface)
    end

    subject { @robot.move }

    context 'normal case' do
      before(:each) do
        @robot.place(2, 2, direction)
      end

      context 'Direction is NORTH' do
        let(:direction) { 'NORTH' }
        before { subject }

        it 'should increase y by 1' do
          expect(@robot.position.y).to eq 3
          expect(@robot.position.x).to eq 2
        end
      end

      context 'Direction is EST' do
        let(:direction) { 'EST' }
        before { subject }

        it 'should increase x by 1' do
          expect(@robot.position.x).to eq 3
          expect(@robot.position.y).to eq 2
        end
      end

      context 'Direction is SOUTH' do
        let(:direction) { 'SOUTH' }
        before { subject }

        it 'should decrease y by 1' do
          expect(@robot.position.x).to eq 2
          expect(@robot.position.y).to eq 1
        end
      end

      context 'Direction is WEST' do
        let(:direction) { 'WEST' }
        before { subject }

        it 'should decrease x by 1' do
          expect(@robot.position.x).to eq 1
          expect(@robot.position.y).to eq 2
        end
      end
    end

    context 'abnormal case' do
      context 'when robot is not placed' do
        before { subject }

        it 'should not change robot attributes' do
          expect(@robot.position).to eq nil
          expect(@robot.direction).to eq nil
        end
      end

      context 'when next move is out of playground' do
        before do
          @robot.place(0, 0, 'SOUTH')
          subject
        end

        it 'should not change robot attributes' do
          expect(@robot.position.x).to eq 0
          expect(@robot.position.y).to eq 0
          expect(@robot.direction).to eq 'SOUTH'
        end
      end
    end
  end
end
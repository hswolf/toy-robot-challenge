require_relative '../main'

RSpec.describe Main do
  describe '#create_robot_reports_from_file' do
    subject { Main.new.create_robot_reports_from_file(input_file, robot) }

    context 'with appropriate file and robot' do
      let(:input_file) { 'input' }
      let(:robot) { Robot.new(TableSurface.new(5, 5)) }

      it { is_expected.to eq ["4,4,NORTH"] }
    end
  end
end
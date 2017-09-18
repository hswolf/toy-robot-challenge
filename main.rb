require_relative 'model/robot'
require_relative 'model/table_surface'

SURFACE_WITH = 5
SURFACE_HEIGHT = 5
INPUT_FILE = 'input'

class Main
  def run(input_file = INPUT_FILE)
    table_surface = TableSurface.new(SURFACE_WITH, SURFACE_HEIGHT)
    robot = Robot.new(table_surface)

    reports = create_robot_reports_from_file(input_file, robot)

    output(reports)
  end

  def create_robot_reports_from_file(input_file, robot)
    reports = []

    File.foreach(input_file).each do |line|
      stripped_line = line.strip
      action = stripped_line.split(' ')[0].downcase

      case stripped_line.split(' ')[0].downcase
      when 'place'
        x, y, direction = stripped_line.split(' ')[1].split(',')
        robot.place(x, y, direction)
      when 'report'
        reports << robot.report
      else
        robot.send(action)
      end
    end

    reports.compact
  end

  def output(reports)
    reports.each do |report|
      puts report
    end
  end
end

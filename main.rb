require_relative 'lib/commands_parser'
require_relative './robot'

class Main


	def self.start_robot

		inst = <<-instructions 
				\n\n\n
				ENTER COMMANDS TO MOVE THE ROBOT WITHIN THE TABLE\n\n
				VALID COMMANDS LISTED BELOW\n\n
				PLACE X,Y,DIRECTION\n
				MOVE -> MOVES THE ROBOT 1 UNIT IN THE DIRECTION IT IS FACING\n
				LEFT -> ROTATE THE ROBOT 90 DEGREES LEFT\n
				RIGHT -> ROTATE THE ROBOT 90 DEGREES RIGHT\n
				REPORT -> DISPLAY X,Y,DIRECTION OF ROBOT\n\n
				TYPE EXIT TO STOP
			instructions

		puts inst

		robot = Robot.new

		loop do
			user_input = gets.chomp

			if user_input == 'help'
				puts;puts;puts inst;puts;puts
			end

			break if user_input.downcase == "exit"

			puts "!!!! INVALID COMMAND, TYPE `help` TO SEE A LIST OF VALID COMMANDS !!!!"  unless CommandsParser.valid_command?(user_input)

			robot.process_commands(user_input)

		end
	end

end

Main.start_robot
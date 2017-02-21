require_relative 'lib/commands_parser'
require_relative 'table'

class Robot

	attr_accessor :x, :y, :direction

	def initialize
		puts "######### INITIALIZING ROBOT ############"
		@x = 0
		@y = 0
		@direction = nil
	end

	def process_commands(command)
		return "ROBOT MUST BE PLACED BEFORE IT CAN ACCPET ANY OTHER COMMANDS" unless command.include?('place') || check_if_robot_on_table
		return place(command) if command.include?('place')
		self.send(command)
	end

	private

	def place(place_command)
		robot_placement_details = place_command.split(" ")[1].split(',')
		new_x, new_y = robot_placement_details[0].to_i, robot_placement_details[1].to_i
		return "INVALID COMMANDS, YOU MUST PLACE ROBOT WITHIN THE TABLE" unless check_if_place_command_has_valid_coordinates(new_x, new_y)
		@x = new_x
		@y = new_y
		@direction = robot_placement_details[2]
	end

	def report
		"#{@x}, #{@y}, #{@direction}"
	end

	def move
		err_msg = "INVALID COMMANDS, YOU CAN NOT MAKE THE ROBOT FALL OFF THE TABLE"
		movable_command = true
		case @direction
			when "east"
				@x + 1 > 5 ? movable_command = false : @x += 1
			when "west"
				@x - 1 <= 0 ? movable_command = false : @x -= 1
			when "south"
				@y - 1 <= 0 ? movable_command = false : @y -= 1
			when "north"
				@y + 1 > 5 ? movable_command = false : @y += 1
			else
				puts "This can't be happening"
		end
		return err_msg unless movable_command
	end

	def right
		direction_index = CommandsParser::DIRECTIONS.index(@direction) + 1
		direction_index = direction_index > 3 ? 0 : direction_index
		@direction = CommandsParser::DIRECTIONS[direction_index]
	end

	def left
		direction_index = CommandsParser::DIRECTIONS.index(@direction) - 1
		direction_index = direction_index < 0 ? 3 : direction_index
		@direction = CommandsParser::DIRECTIONS[direction_index]
	end

	def check_if_robot_on_table
		@x > 0
	end

	def check_if_place_command_has_valid_coordinates(new_x_coordinate, new_y_coordinate)
		new_x_coordinate.between?(0, Table.length) && new_y_coordinate.between?(0, Table.width)
	end

end
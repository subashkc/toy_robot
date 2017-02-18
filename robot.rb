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
		return false unless command.downcase.include?('place') || check_if_robot_on_table
		return place(command) if command.downcase.include?('place')
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
		return "INVALID COMMANDS, YOU CAN NOT DESTROY THE ROBOT" if check_if_robot_falls
		case @direction.downcase

			when "east"
				@x += 1
			when "west"
				@x -= 1
			when "south"
				@y -= 1
			when "north"
				@y += 1
			else
				puts "This can't be happening"

		end
	end

	def right
		direction_index = CommandsParser::DIRECTIONS.index(@direction) + 1
		direction_index > 3 ? 0 : direction_index
		@direction = CommandsParser::DIRECTIONS[direction_index]
	end

	def left
		direction_index = CommandsParser::DIRECTIONS.index(@direction) - 1
		direction_index < 0 ? 3 : direction_index
		@direction = CommandsParser::DIRECTIONS[direction_index]
	end

	def check_if_robot_falls
		@x + 1 > Table.length || @x -1 < 0 || @y + 1 > Table.width || @y - 1 < 0
	end

	def check_if_robot_on_table
		return @x > 0
	end

	def check_if_place_command_has_valid_coordinates(new_x_coordinate, new_y_coordinate)
		(new_x_coordinate > 0 && new_x_coordinate <= Table.length) && (new_y_coordinate > 0 && new_y_coordinate <= Table.width)
	end

end
require_relative 'lib/commands'
require_relative 'lib/directions'
require_relative 'lib/commands_parser'
require_relative 'table'
require 'pry'
class Robot

	attr_accessor :x_coordinate, :y_coordinate, :direction

	def initialize
		puts "######### INITIALIZING ROBOT ############"
		@x_coordinate = nil
		@y_coordinate = nil
		@direction = nil
	end

	def process_commands command
		return false unless CommandsParser.valid_command?(command)
		return "ROBOT MUST BE PLACED BEFORE IT CAN ACCPET ANY OTHER COMMANDS" unless command.include?('place') || check_if_robot_on_table
		return place(command) if command.include?('place')		
		self.send(command)
	end

	def get_new_direction rotating_direction
		Directions.get_new_direction(@direction, rotating_direction)
	end

	private

	def place place_command
		robot_placement_details = place_command.split(" ")[1].split(',')
		new_x_coordinate, new_y_coordinate = robot_placement_details[0].to_i, robot_placement_details[1].to_i
		return "INVALID COMMANDS, YOU MUST PLACE ROBOT WITHIN THE TABLE" unless check_if_place_command_has_valid_coordinates(new_x_coordinate, new_y_coordinate)
		return "INVALID DIRECTION, TYPE `help` TO SEE A LIST OF VALID DIRECTIONS" unless Directions.get_directions.include?(robot_placement_details[2])
		@x_coordinate, @y_coordinate = new_x_coordinate, new_y_coordinate
		@direction = robot_placement_details[2]
		true
	end

	def report
		"#{@x_coordinate}, #{@y_coordinate}, #{@direction}"
	end

	# I don't want to test the move logic in the move function but there is some 
	# what code duplication between move and is_valid_move?, need to figure out a way
	# to refactor them
	
	def move
		return "INVALID COMMANDS, YOU CAN NOT MAKE THE ROBOT FALL OFF THE TABLE" unless is_valid_move?
		case @direction
		when "east"
			@x_coordinate += 1
		when "west"
			@x_coordinate -= 1
		when "south"
			@y_coordinate -= 1
		when "north"
			@y_coordinate += 1
		else
			puts "This can't be happening"
		end
		true
	end

	def is_valid_move?
		case @direction
		when "east"
			return false if @x_coordinate + 1 >= Table.length
		when "west"
			return false if @x_coordinate - 1 < Table.origin_x
		when "south"
			return false if @y_coordinate - 1 < Table.origin_y
		when "north"
			return false if @y_coordinate + 1 >= Table.width
		else
			puts "This can't be happening"
		end
		true
	end

	["left", "right"].each do |direction|
		define_method direction do
			@direction = Directions.get_new_direction(@direction, direction.to_s)
			true
		end
	end
	
	def check_if_robot_on_table
		Table.is_within?(@x_coordinate, @y_coordinate)
	end

	def check_if_place_command_has_valid_coordinates new_x_coordinate, new_y_coordinate
		Table.is_within?(new_x_coordinate, new_y_coordinate)
	end

end

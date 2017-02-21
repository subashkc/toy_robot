class CommandsParser

	class << self

		def valid_command?(user_command)
			return validate_place_command(user_command, Directions.get_directions, Table.length, Table.width) if user_command.split(" ")[0] === "place"
			Commands.get_commands.any? { |valid_command| valid_command === user_command }			
		end

		private

		def validate_place_command(place_command, directions, length, width)
			return false unless place_command =~ /^place\s[0-4],[0-4],[a-zA-z]{4,5}$/i
			command_parts = place_command.split(' ')
			coordinates_info = command_parts[1].split(',')
			x_coordinate = Integer coordinates_info[0]
			y_coordinate = Integer coordinates_info[1]
			(command_parts[0] === 'place' && x_coordinate.between?(0,length) && y_coordinate.between?(0,width) && directions.include?(coordinates_info[2]))
		end
	
	end
	
end
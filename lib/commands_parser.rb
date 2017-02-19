class CommandsParser

	COMMANDS = ["move", "place", "left", "right", "report"].freeze
	DIRECTIONS = ["north", "east", "south", "west"].freeze

	class << self

		def valid_command?(user_command)
			return validate_place_command(user_command) if user_command.split(" ")[0].downcase === "place"
			COMMANDS.any? { |valid_command| valid_command.downcase === user_command.downcase }
		end

		private

		def validate_place_command(place_command)		
			command_match = place_command =~ /^PLACE\s[1-5],[1-5],(\bnorth\b|\beast\b|\bsouth\b|\bwest\b)$/i
			command_match === 0
		end

	end
	
end
class CommandsParser

	class << self

		def valid_command? user_command 
			return validate_place_command(user_command) if user_command.split(" ")[0] === "place"
			Commands.get_commands.any? { |valid_command| valid_command === user_command }			
		end

		private

		def validate_place_command place_command
			valid_command = place_command =~ /^place\s\d,\d,[a-zA-z]+$/i
			valid_command === 0
		end
	
	end
	
end
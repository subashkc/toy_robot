class Commands

	COMMANDS = ["move", "place", "left", "right", "report"].freeze

	class << self

		def get_commands
			COMMANDS
		end
	end
end
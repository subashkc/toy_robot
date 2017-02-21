require_relative '../../lib/commands_parser'

describe CommandsParser do

	context "Commands" do

		context "commands validator" do
			it "validates valid commands" do
				expect(CommandsParser.valid_command?("move")).to be true
				expect(CommandsParser.valid_command?("left")).to be true
				expect(CommandsParser.valid_command?("right")).to be true
				expect(CommandsParser.valid_command?("report")).to be true
				expect(CommandsParser.valid_command?("place 1,2,East")).to be true
			end

			it "invalidated invalid command" do
				expect(CommandsParser.valid_command?("Rotate")).to be false
				expect(CommandsParser.valid_command?("Forward")).to be false
			end
		end

	end
	
end
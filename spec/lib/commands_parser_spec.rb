require_relative '../../lib/commands_parser'

describe CommandsParser do

	context "commands validator" do
		it "validates valid commands" do
			expect(CommandsParser.valid_command?("move")).to be true
			expect(CommandsParser.valid_command?("left")).to be true
			expect(CommandsParser.valid_command?("right")).to be true
			expect(CommandsParser.valid_command?("report")).to be true
			expect(CommandsParser.valid_command?("place 1,2,east")).to be true
		end

		it "invalidates invalid commands" do
			expect(CommandsParser.valid_command?("Rotate")).to be false
			expect(CommandsParser.valid_command?("Forward")).to be false
			expect(CommandsParser.valid_command?("place")).to be false
			expect(CommandsParser.valid_command?("place 1,2,southeast")).to be false
		end

		it "invalidates incomplete commands" do
			expect(CommandsParser.valid_command?("place -1,2,east")).to be false
			expect(CommandsParser.valid_command?("mov")).to be false
			expect(CommandsParser.valid_command?("repor")).to be false
		end

	end
	
end
require_relative '../lib/commands_parser'

describe CommandsParser do

	context "Directions" do
		
		context "list of directions" do
			
			it "has a list of predefined directions" do
				expect(CommandsParser::DIRECTIONS).to match_array(["North", "East", "South", "West"])
			end

			it "does not match an invalid direction" do
				expect(CommandsParser::DIRECTIONS.include?("invalid_direction")).to be false
			end
			
		end

		context "add a new direction" do
			it "can not add a direction" do
				expect { CommandsParser::DIRECTIONS << "South East" }.to raise_error(RuntimeError)
			end
		end

	end

	context "Commands" do

		context "list of commands" do
			it "has a list of predefined commands" do
				expect(CommandsParser::COMMANDS).to match_array(["Move", "Left", "Right", "Report", "Place"])
			end		
		end

		context "add a new command" do

			it "can not add a command" do
				expect { CommandsParser::COMMANDS << "JUMP" }.to raise_error(RuntimeError)
			end
			
		end


		context "commands validator" do
			it "validates valid commands" do
				expect(CommandsParser.valid_command?("Move")).to be true
				expect(CommandsParser.valid_command?("Left")).to be true
				expect(CommandsParser.valid_command?("Right")).to be true
				expect(CommandsParser.valid_command?("Report")).to be true
				expect(CommandsParser.valid_command?("Place 1,2,East")).to be true
			end

			it "invalidated invalid command" do
				expect(CommandsParser.valid_command?("Rotate")).to be false
				expect(CommandsParser.valid_command?("Forward")).to be false
			end
		end

	end
	
end
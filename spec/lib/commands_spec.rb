require_relative '../../lib/commands'

describe Commands do

	context "list of commands" do

		it "has a list of predefined commands" do

			expect(Commands.get_commands).to match_array(["move", "left", "right", "report", "place"])

		end	

	end

	context "add a new command" do

		it "can not add a command" do
			expect { Commands::COMMANDS << "JUMP" }.to raise_error(RuntimeError)
		end
	
	end
	
end
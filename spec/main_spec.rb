require_relative 'lib/commands_parser'

describe Main do
	
	context "" do

		it "should return false for invalid commands" do
			expect(@robot.process_commands("dummy-command")).to be false
		end

		it "should return true for valid commands" do
			expect(@robot.process_commands("move")).to be true			
		end
		
	end
end
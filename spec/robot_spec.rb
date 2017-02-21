require_relative '../robot'

describe Robot do 

	before(:example) do 
		@robot = Robot.new
	end

	context "Robot initialize" do

		it "should have X, Y coordinates and a direction" do
			expect(@robot.x).to be_nil
			expect(@robot.y).to be_nil
			expect(@robot.direction).to be_nil
		end

	end

	context "Commands" do

		it "should have a place Command" do
			@robot.process_commands("place 1,2,east")
			expect(@robot.x).to be 1
			expect(@robot.y).to be 2
			expect(@robot.direction).to eq('east')
		end

		it "should have a report Command" do 
			@robot.process_commands("place 1,2,east")
			expect(@robot.process_commands("report")).to eql("1, 2, east")
		end

		it "should have a move Command" do
			@robot.process_commands("place 1,2,east")
			@robot.process_commands("move")
			expect(@robot.x).to be 2
		end

		it "should have a left Command" do 
			@robot.process_commands("place 1,2,east")
			@robot.process_commands("left")
			expect(@robot.direction).to eql("north")
		end

		it "should have a right Command" do
			@robot.process_commands("place 1,2,north")
			@robot.process_commands("right")
			expect(@robot.direction).to eql("east")
		end

		it "should not accept a invalid move command" do
			@robot.process_commands("place 4,4,east")
			@robot.process_commands("move")
			expect(@robot.x).to be 4
			expect(@robot.y).to be 4
		end

	end


end

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

		it "should not accept move command before place command" do
			@robot.process_commands('move')
			expect(@robot.x).to be_nil
			expect(@robot.y).to be_nil
			expect(@robot.direction).to be_nil
		end

		it "should not accept left command before place command" do
			@robot.process_commands('left')
			expect(@robot.x).to be_nil
			expect(@robot.y).to be_nil
			expect(@robot.direction).to be_nil
		end

		it "should not accept right command before place command" do
			@robot.process_commands('right')
			expect(@robot.x).to be_nil
			expect(@robot.y).to be_nil
			expect(@robot.direction).to be_nil
		end

		it "should not accept report command before place command" do
			resp = @robot.process_commands('left')
			expect(resp).to eql('ROBOT MUST BE PLACED BEFORE IT CAN ACCPET ANY OTHER COMMANDS')
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

		it "should accpet a series of valid commands and ignore invalid commands" do
			@robot.process_commands("place 0,0,east")
			@robot.process_commands("move")
			@robot.process_commands("haha")
			@robot.process_commands("left")
			@robot.process_commands("move")
			resp = @robot.process_commands('report')
			expect(resp).to eql('1, 1, north')
			expect(@robot.x).to be 1
			expect(@robot.y).to be 1
			expect(@robot.direction).to eql('north')
		end

	end


end

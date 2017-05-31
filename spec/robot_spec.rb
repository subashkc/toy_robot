require_relative '../robot'

describe Robot do 

	let(:robot) { Robot.new }

	context "Robot initialize" do

		it "should have X, Y coordinates and a direction" do
			expect(robot.x_coordinate).to be_nil
			expect(robot.y_coordinate).to be_nil
			expect(robot.direction).to be_nil
		end

	end

	context "Commands" do


		it "should have a place Command" do
			robot.process_commands("place 1,2,east")
			expect(robot.x_coordinate).to be 1
			expect(robot.y_coordinate).to be 2
			expect(robot.direction).to eq('east')
		end

		it "should not accept move command before place command" do
			robot.process_commands('move')
			expect(robot.x_coordinate).to be_nil
			expect(robot.y_coordinate).to be_nil
			expect(robot.direction).to be_nil
		end

		it "should not accept left command before place command" do
			robot.process_commands('left')
			expect(robot.x_coordinate).to be_nil
			expect(robot.y_coordinate).to be_nil
			expect(robot.direction).to be_nil
		end

		it "should not accept right command before place command" do
			robot.process_commands('right')
			expect(robot.x_coordinate).to be_nil
			expect(robot.y_coordinate).to be_nil
			expect(robot.direction).to be_nil
		end

		it "should not accept report command before place command" do
			resp = robot.process_commands('report')
			expect(resp).to eql('ROBOT MUST BE PLACED BEFORE IT CAN ACCPET ANY OTHER COMMANDS')
		end

		it "should have a report Command" do 
			robot.process_commands("place 1,2,east")
			expect(robot.process_commands("report")).to eql("1, 2, east")
		end

		it "should have a move Command" do
			robot.process_commands("place 1,2,east")
			robot.process_commands("move")
			expect(robot.x_coordinate).to be 2
		end

		it "should have a left Command" do 
			robot.process_commands("place 1,2,east")
			robot.process_commands("left")
			expect(robot.direction).to eql("north")
		end

		it "should have a right Command" do
			robot.process_commands("place 1,2,north")
			robot.process_commands("right")
			expect(robot.direction).to eql("east")
		end

		it "should not accept a invalid move command in north direction" do
			robot.process_commands("place 4,4,north")
			robot.process_commands("move")
			expect(robot.x_coordinate).to be 4
			expect(robot.y_coordinate).to be 4
		end

		it "should not accept a invalid move command in east direction" do
			robot.process_commands("place 4,4,east")
			robot.process_commands("move")
			expect(robot.x_coordinate).to be 4
			expect(robot.y_coordinate).to be 4
		end

		it "should not accept a invalid move command in south direction" do
			robot.process_commands("place 0,0,south")
			robot.process_commands("move")
			expect(robot.x_coordinate).to be 0
			expect(robot.y_coordinate).to be 0
		end

		it "should not accept a invalid move command in west direction" do
			robot.process_commands("place 0,0,west")
			robot.process_commands("move")
			expect(robot.x_coordinate).to be 0
			expect(robot.y_coordinate).to be 0
		end

		it "should accpet a series of valid commands and ignore invalid commands" do
			robot.process_commands("place 0,0,east")
			robot.process_commands("move")
			robot.process_commands("haha")
			robot.process_commands("left")
			robot.process_commands("move")
			robot.process_commands("left")
			robot.process_commands("move")
			robot.process_commands("left")
			robot.process_commands("move")		
			resp = robot.process_commands('report')
			expect(resp).to eql('0, 0, south')
			expect(robot.x_coordinate).to be 0
			expect(robot.y_coordinate).to be 0
			expect(robot.direction).to eql('south')
		end

		it "should not accept a invalid place command" do
			expect(robot.process_commands('place -1,0,east')).to be false
			expect(robot.process_commands('place 6,6,east')).to eql('INVALID COMMANDS, YOU MUST PLACE ROBOT WITHIN THE TABLE')
		end

	end

end

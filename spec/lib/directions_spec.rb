require_relative '../../lib/directions'

describe Directions do
	
	context "Directions" do
		
		context "list of directions" do
			
			it "has a list of predefined directions" do
				expect(Directions.get_directions).to match_array(["north", "east", "south", "west"])
			end

			it "does not match an invalid direction" do
				expect(Directions.get_directions.include?("invalid_direction")).to be false
			end
			
		end

		context "add a new direction" do

			it "can not add a direction" do
				expect { Directions::DIRECTIONS << "South East" }.to raise_error(RuntimeError)
			end

		end

		context "direction and index" do

			it "gives a direction based on the index" do
				expect(Directions.get_direction(0)).to eql('north')
				expect(Directions.get_direction(1)).to eql('east')
				expect(Directions.get_direction(2)).to eql('south')
				expect(Directions.get_direction(3)).to eql('west')
			end

			it "gives index of the given direction" do
				expect(Directions.get_direction_index('north')).to be 0
				expect(Directions.get_direction_index('east')).to be 1
				expect(Directions.get_direction_index('south')).to be 2
				expect(Directions.get_direction_index('west')).to be 3
			end

			it "gives a new direction on basis of given turning direction" do
				expect(Directions.get_new_direction('north','right')).to eql('east')
				expect(Directions.get_new_direction('north','left')).to eql('west')
			end
	
		end

	end

end

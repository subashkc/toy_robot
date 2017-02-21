require_relative '../table'

describe Table do
	context "table" do
		it "is a 5x5 dimension" do
			expect(Table.length).to eql(5)
			expect(Table.width).to eql(5)
		end

		it "can check if a coordinate is within its dimension" do
			expect(Table.is_within?(1,2)).to be true
			expect(Table.is_within?(5,5)).to be false
		end
	end
end
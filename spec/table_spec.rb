require_relative '../table'

describe Table do
	context "table" do
		it "is a 5x5 dimension" do
			expect(Table.length).to eql(5)
			expect(Table.width).to eql(5)
		end
	end
end
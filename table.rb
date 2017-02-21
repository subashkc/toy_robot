class Table

	class << self
		attr_reader :length, :width, :origin_x, :origin_y

		def is_within?(x,y)
			x && (@origin_x...@length).include?(x) && y && (@origin_y...@width).include?(y)
		end
	end

	@length = 5
	@width = 5
	@origin_x = 0
	@origin_y = 0

end
class Directions

	DIRECTIONS = ["north", "east", "south", "west"].freeze

	class << self

		def get_directions
			DIRECTIONS
		end

		def get_new_direction old_direction, rotate_direction
			old_direction_index = get_directions.index(old_direction)
			new_direction_index = rotate_direction == 'left' ? old_direction_index - 1 : old_direction_index + 1
			new_direction_index = 0 if new_direction_index > 3
			new_direction_index = 3 if new_direction_index < 0
			get_directions[new_direction_index]
		end

	end
end
module Cardinal
  # constant hash of acceptable cardinal directions
  DIRECTIONS = { north: 'N', east: 'E', south: 'S', west: 'W' }

    def direction(value)
    # rovers will align along the Martian magnetic if confused about
    # their orientation. Mars has magnetic north (this may be a thumbsuck).
    DIRECTIONS.include?(value) ? value : :north
  end
end

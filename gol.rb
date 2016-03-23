module GameOfLife
  class World
    attr_reader :state

    def initialize(hash)
      @state = hash
      @state.default = false

      @next_state = {}
      @next_state.default = false
    end

    def next
      @state.each do |o_coord, _|
        (surroundings(o_coord) + [o_coord]).each do |n_coord|
          computed_state = case neighbour_count(n_coord)
                           when 2
                             @state[n_coord]
                           when 3
                             true
                           else
                             false
                           end

          @next_state[n_coord] = computed_state if computed_state
        end
      end

      self.class.new(@next_state)
    end

    def neighbour_count(coordinate)
      surroundings(coordinate).count do |c|
        @state[c]
      end
    end

    def surroundings(coordinate)
      grid_mask.map do |left, right|
        [coordinate[0] + left, coordinate[1] + right]
      end
    end

    def grid_mask
      [-1, 0, 1].product([-1, 0, 1]) - [[0, 0]]
    end

    def ==(other)
      @state == other.state
    end
  end
end

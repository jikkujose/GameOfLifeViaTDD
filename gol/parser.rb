module GameOfLife
  class Parser
    attr_reader :input

    def initialize(file)
      @input = File
        .open(file, "r")
        .read
        .strip
    end

    def output
      hash = {}
      hash.default = false

      @input
        .split("\n")
        .each_with_index do |line, i|
        line
          .split
          .each_with_index do |state, k|
          next if state == "0"
          hash[[i, k]] = true
        end
      end

      hash
    end
  end
end

module GameOfLife
  class Board
    def initialize(hash)
      @hash = hash
      @hash.default = false
    end

    def print
      puts layout
    end

    def layout
      rows.map do |i|
        columns.map do |k|
          @hash[[i, k]] ? "1" : "0"
        end
          .join(" ")
      end
        .join("\n")
    end

    def rows
      row_indicies ||= @hash
        .keys
        .map(&:first)
        .sort

      return [] unless row_indicies.first

      (row_indicies.first..row_indicies.last).to_a
    end

    def columns
      column_indicies ||= @hash
        .keys
        .map(&:last)
        .sort

      return [] unless column_indicies.first

      (column_indicies.first..column_indicies.last).to_a
    end
  end
end

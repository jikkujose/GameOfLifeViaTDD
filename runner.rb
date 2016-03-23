require_relative './gol.rb'
require_relative './gol/board.rb'
require_relative './gol/parser.rb'

ITERATIONS = 50

module GameOfLife
  def self.run(file_name: "")
    parsed = Parser.new(file_name).output
    initial_world = World.new parsed

    final_world = ITERATIONS
      .times
      .inject(initial_world) do |accumilator, _|
      accumilator.next
    end

    Board
      .new(final_world.state)
      .print
  end
end

GameOfLife.run(file_name: ARGV[0])

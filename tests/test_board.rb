require_relative './test_helper.rb'
require_relative '../gol/board.rb'

class TestBoard < Minitest::Test
  def setup
    @f = GameOfLife::Board
  end

  def test_empty
    hash = {}
    assert_equal "", @f.new(hash).layout
  end

  def test_single
    hash = {[2, 45] => true}
    assert_equal "1", @f.new(hash).layout
  end

  def test_diagonal
    hash = {[0, 0] => true, [1, 1] => true}
    assert_equal "1 0\n0 1", @f.new(hash).layout
  end
end

Minitest.autorun

require_relative './test_helper.rb'
require_relative '../gol/world.rb'

class WorldTest < Minitest::Test
  def setup
    @g = GameOfLife::World
  end

  def test_empty
    hash = {}
    assert_equal @g.new(hash), @g.new(hash).next
  end

  def test_single
    hash = {[23, 4] => true}
    assert_equal @g.new({}), @g.new(hash).next
  end

  def test_square
    hash = {
      [0, 0] => true,
      [0, 1] => true,
      [1, 0] => true,
      [1, 1] => true
    }

    assert_equal @g.new(hash), @g.new(hash).next
  end

  def test_cross_repeater
    repeat_0 = {
      [0, 0] => true,
      [0, 1] => true,
      [0, 2] => true,
    }

    repeat_1 = {
      [-1, 1] => true,
      [0, 1] => true,
      [1, 1] => true,
    }

    assert_equal @g.new(repeat_0), @g.new(repeat_1).next
  end

  def test_beacon
    repeat_0 = {
      [0, 0] => true,
      [0, 1] => true,
      [1, 0] => true,
      [1, 1] => true,
      [2, 2] => true,
      [2, 3] => true,
      [3, 2] => true,
      [3, 3] => true,
    }

    repeat_1 = {
      [0, 0] => true,
      [0, 1] => true,
      [1, 0] => true,
      [2, 3] => true,
      [3, 2] => true,
      [3, 3] => true,
    }

    assert_equal @g.new(repeat_0), @g.new(repeat_1).next
  end
end

Minitest.autorun

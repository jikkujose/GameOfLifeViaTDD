require_relative './test_helper.rb'
require_relative '../gol/parser.rb'

class ParserTest < Minitest::Test
  def setup
    @parser = GameOfLife::Parser
  end

  def file(n)
    "tests/fixtures/0#{n}_input.txt"
  end

  def test_01
    assert_equal "0", @parser.new(file(1)).input
  end

  def test_02
    assert_equal "0 1\n0 0", @parser.new(file(2)).input
  end

  def test_hash_01
    hash = {}
    assert_equal hash, @parser.new(file(1)).output
  end

  def test_hash_02
    hash = {[0, 1] => true}
    assert_equal hash, @parser.new(file(2)).output
  end

  def test_hash_03
    hash = {
      [0, 0] => true,
      [0, 1] => true,
      [1, 0] => true,
      [1, 1] => true
    }

    assert_equal hash, @parser.new(file(3)).output
  end

  def test_hash_04
    hash = {[0, 0] =>true, [1, 1] => true}
    assert_equal hash, @parser.new(file(4)).output
  end

  def test_hash_05
    hash = {
      [1, 1] => true,
      [1, 2] => true,
      [2, 1] => true,
      [2, 2] => true
    }

    assert_equal hash, @parser.new(file(5)).output
  end
end

Minitest.autorun

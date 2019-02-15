require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind/checker'
class MastermindCheckerTest < Minitest::Test
  def test_it_exists
    mc = Mastermind::Checker.new('rbgy')
    assert_instance_of Mastermind::Checker, mc
  end
  def test_it_can_check_when_true
    mc = Mastermind::Checker.new('rbgy')
    assert mc.check('rbgy')
  end
  def test_it_has_wrong_character_type_correct
    mc = Mastermind::Checker.new('rbgy')
    refute mc.check('rbgi')
    assert_equal mc.corrections, ["(r)ed (b)lue (g)reen (y)ellow does not include (i)"]
  end
  def test_it_has_wrong_length_in_corrections
    mc = Mastermind::Checker.new('rbgyy')
    refute mc.check('rbgy')
    assert_equal mc.corrections, ["Guess was 4 characters. Guess should be 5 characters"]
  end

  def test_correct_positions
    mc = Mastermind::Checker.new('rbgy')
    refute mc.check('rbgg')
    assert_equal mc.correct_positions, 3
  end

  def test_correct_colors
    mc = Mastermind::Checker.new('rbgy')
    refute mc.check('rbyg')
    assert_equal mc.correct_colors, 4
  end

  def test_hint
    mc = Mastermind::Checker.new('rbgy')
    refute mc.check('rbyg')
    assert_equal mc.hint, ("'rbyg' has 4 of the correct elements with 2 in the correct positions")
  end
end

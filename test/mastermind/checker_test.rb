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
end

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def setup
    @activity = Activity.new("Fishing", {"Bob" => 240, "Sally" => 120, "Jim" => 200})
  end

  def test_it_has_attributes
    assert_equal "Fishing", @activity.name
    assert_equal ({"Bob" => 240, "Sally" => 120, "Jim" => 200}), @activity.participants
  end

  def test_it_can_add_participants
    @activity.add_participant("Phil", 500)

    assert_equal ({"Bob" => 240, "Sally" => 120, "Jim" => 200, "Phil" => 500}), @activity.participants
  end

  def test_it_can_add_total_cost
    assert_equal 560.00, @activity.total_cost
  end

  def test_it_can_split_the_cost_of_activity
    assert_equal 186.67, @activity.split_cost
  end

  def test_it_can_determine_how_much_each_person_is_owed
    @activity.settle_up
    assert_equal ({"Bob" => -53.33, "Sally" => 66.67, "Jim" => -13.33}), @activity.participants_settle_up
  end
end

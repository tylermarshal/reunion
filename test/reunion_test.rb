require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

  def setup
    @reunion = Reunion.new("Park", Activity.new("Fishing", {"Bob" => 240, "Sally" => 120, "Jim" => 200}))
    @activity1 = @reunion.activities[0]
    @activity2 = @reunion.activities[1]
  end

  def test_it_has_attributes
    assert_equal "Park", @reunion.location
    assert_equal [@activity1], @reunion.activities
    assert_equal "Fishing", @activity1.name
  end

  def test_it_can_add_activities
    @reunion.add_activities("Barbeque", {"Bob" => 0, "Sally" => 5000, "Jim" => 800})
    activity2 = @reunion.activities[1]

    assert_equal [@activity1, activity2], @reunion.activities
  end

  def test_it_can_add_total_cost_of_reunion
    @reunion.add_activities("Barbeque", {"Bob" => 0, "Sally" => 5000, "Jim" => 800})

    assert_equal 6360, @reunion.total_cost
  end

  def test_it_can_split_the_cost_of_reunion
    @reunion.add_activities("Barbeque", {"Bob" => 0, "Sally" => 5000, "Jim" => 800})

    assert_equal 2120, @reunion.split_cost
  end

end

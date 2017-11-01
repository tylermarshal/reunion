require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test

  def setup
    @reunion = Reunion.new("Park", Activity.new("Fishing", {"Bob" => 240, "Sally" => 120, "Jim" => 200}))
  end

  def test_it_has_attributes
    assert_equal "Park", @reunion.location
    # assert_equal [Activity.new("Fishing", {"Bob" => 240, "Sally" => 120, "Jim" => 200})], @reunion.activities
  end

  def test_it_can_add_activities
    @reunion.add_activities("Fishing", {"Bob" => 240, "Sally" => 120, "Jim" => 200})
    @reunion.add_activities("Barbeque", {"Bob" => 0, "Sally" => 5000, "Jim" => 800})
    assert_equal [Activity.new("Fishing", {"Bob" => 240, "Sally" => 120, "Jim" => 200}), Activity.new(Barbecue, {"Bob" => 0, "Sally" => 5000, "Jim" => 800})], @reunion.activities
  end


end

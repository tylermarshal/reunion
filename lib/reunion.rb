require './lib/activity'

class Reunion

  attr_reader :location, :activities

  def initialize(location, activities)
    @location = location
    @activities = [] << activities
  end

  def add_activities(name, participant)
    activities << Activity.new(name, participant)
  end

end

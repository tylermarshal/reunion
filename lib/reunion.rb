require './lib/activity'
require 'pry'

class Reunion

  attr_reader :location, :activities

  def initialize(location, activity)
    @location = location
    @activities = [activity]
  end

  def add_activities(name, participant)
    activities << Activity.new(name, participant)
  end

  def total_cost
    total_cost = 0
    activities.each do |activity|
      total_cost += activity.participants.values.sum
    end
    total_cost
  end

  def split_cost
    total_participants = {}
    activities.each do |activity|
      total_participants.merge!(activity.participants)
    end
    (total_cost/total_participants.keys.count).round(2)
  end

end

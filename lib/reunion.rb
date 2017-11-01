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
    (total_cost/activities[0].keys.count).round(2)
  end

  # def settle_up
  #   participants_settle_up = {}
  #   participants.each do |key, value|
  #     participants_settle_up[key] = (split_cost - value)
  #   end
  #   participants_settle_up
  # end

end

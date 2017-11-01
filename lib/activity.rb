require 'bigdecimal'

class Activity

  attr_reader :name, :participants, :participants_settle_up

  def initialize(name, participants)
    @name = name
    @participants = participants
    @participants_settle_up = {}
  end

  def add_participant(name,expenditure)
    participants[name] = expenditure
  end

  def total_cost
    BigDecimal.new(participants.values.reduce(0) { |sum, expense| sum += expense })
  end

  def split_cost
    (total_cost/participants.keys.count).round(2)
  end

  def settle_up
    participants.each do |key, value|
      participants_settle_up[key] = (split_cost - value)
    end
  end


end

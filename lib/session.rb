# Session
class Session
  attr_reader :talks
  attr_reader :available_time

  def initialize(length)
    fail 'session length must be an integer' unless length.is_a? Integer
    @talks = []
    @available_time = length
  end

  def add(talk)
    fail 'talk is too long for session' unless add? talk
    @available_time -= talk.length
    @talks << talk
  end

  def add?(talk)
    return false if talk.length > @available_time

    true
  end

  def include?(talk)
    @talks.include? talk
  end
end

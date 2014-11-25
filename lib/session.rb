# Session
class Session
  attr_reader :talks
  attr_reader :length

  def initialize(length)
    @talks = []
    @length = length
  end

  def add(talk)
    fail 'talk is too long for session' if talk.length > @length
    @talks << talk
  end

  def include?(talk)
    @talks.include? talk
  end
end

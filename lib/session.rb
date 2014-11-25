# Session
class Session
  attr_reader :talks

  def initialize
    @talks = []
  end

  def add(talk)
    @talks << talk
  end

  def include?(talk)
    @talks.include? talk
  end
end

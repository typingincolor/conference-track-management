# Planner
class Planner
  def initialize(talks, session_lengths)
    @talks = talks
    @sessions = []
    session_lengths.each do |session_length|
      @sessions.push(Session.new session_length)
    end
  end

  def plan
    @talks.each do |talk|
      @sessions[0].add talk
    end

    @sessions
  end
end

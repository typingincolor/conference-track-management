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
    processed = Array.new @talks.length, false
    @sessions.each do |session|
      @talks.each_with_index do |talk, index|
        next if processed[index]
        if session.add? talk
          session.add talk
          processed[index] = true
        end
      end
    end

    @sessions
  end
end

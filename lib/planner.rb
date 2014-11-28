# Planner
class Planner
  def plan(talks, session_lengths)
    sessions = setup_sessions(session_lengths)
    iterate_over_sessions(sessions, talks)
  end

  def setup_sessions(session_lengths)
    sessions = []

    session_lengths.each do |session_length|
      sessions.push(Session.new session_length)
    end

    sessions
  end

  def iterate_over_sessions(sessions, talks)
    talks_processed = Array.new talks.length, false
    sessions.each do |session|
      iterate_over_talks session, talks, talks_processed
    end
    sessions
  end

  def iterate_over_talks(session, talks, talks_processed)
    talks.each_with_index do |talk, index|
      next if talks_processed[index]
      if session.add? talk
        session.add talk
        talks_processed[index] = true
      end
    end
  end

  private :setup_sessions, :iterate_over_sessions, :iterate_over_talks
end

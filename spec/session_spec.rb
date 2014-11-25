# Session Spec
require 'spec_helper'

describe 'session' do
  it 'can add a talk to a session' do
    session = Session.new 100
    talk = Talk.new 'a talk 25min'

    session.add talk

    expect(session.talks).to include talk
  end

  it 'will not add a talk if there is not enough time in a session' do
    session = Session.new 20
    talk = Talk.new 'a too long talk 25min'

    expect { session.add talk }.to raise_error 'talk is too long for session'
  end
end

# Session Spec
require 'spec_helper'

describe 'session' do
  it 'can add a talk to a session' do
    session = Session.new
    talk = Talk.new 'a talk 25min'

    session.add talk

    expect(session.talks).to include talk
  end
end

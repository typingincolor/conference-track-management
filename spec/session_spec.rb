# Session Spec
require 'spec_helper'

describe 'session' do
  it 'fails if the session length is not a integer' do
    expect { Session.new 'xxx' }.to raise_error \
    'session length must be an integer'
  end

  it 'can add a talk to a session' do
    session = Session.new 100
    talk = Talk.new 'a talk 25min'

    session.add talk

    expect(session.talks).to include talk
  end

  it 'add? returns true if talk length < available time in session' do
    session = Session.new 20
    talk1 = Talk.new 'a talk 10min'

    expect(session.add? talk1).to eq true
  end

  it 'add? returns true if talk length = available time in session' do
    session = Session.new 20
    talk1 = Talk.new 'a talk 20min'

    expect(session.add? talk1).to eq true
  end

  it 'add? returns false if talk length > available time in session' do
    session = Session.new 20
    talk1 = Talk.new 'a talk 30min'

    expect(session.add? talk1).to eq false
  end

  it 'will not add a talk if there is not enough time in a session' do
    session = Session.new 20
    talk = Talk.new 'a too long talk 25min'

    expect { session.add talk }.to raise_error 'talk is too long for session'
  end

  it 'will not add a second talk if the total time is too long' do
    session = Session.new 20
    talk1 = Talk.new 'a talk 10min'
    talk2 = Talk.new 'a too long talk 15min'

    session.add talk1
    expect(session.talks).to include talk1

    expect { session.add talk2 }.to raise_error 'talk is too long for session'
  end

  it 'avaliable time is zero when all time is used up' do
    session = Session.new 20
    talk1 = Talk.new 'a talk 10min'
    talk2 = Talk.new 'an ok talk 10min'

    session.add talk1
    session.add talk2

    expect(session.talks).to include talk1
    expect(session.talks).to include talk2
    expect(session.available_time).to eq 0
  end

  it 'avaliable time is correct when talks are added' do
    session = Session.new 20
    talk1 = Talk.new 'a talk 10min'
    talk2 = Talk.new 'an ok talk 5min'

    session.add talk1
    session.add talk2

    expect(session.talks).to include talk1
    expect(session.talks).to include talk2
    expect(session.available_time).to eq 5
  end
end

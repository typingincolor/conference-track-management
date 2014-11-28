# Talk List Spec
require 'spec_helper'

describe 'planner' do
  it 'can add talks to a session when there is enough time' do
    list = TalkList.new

    talk1 = Talk.new 'talk one 10min'
    talk2 = Talk.new 'talk two 20min'
    list << talk1 << talk2

    planner = Planner.new list, [30]

    result = planner.plan

    expect(result[0].talks.length).to eq 2
    expect(result[0].talks[0]).to eq talk1
    expect(result[0].talks[1]).to eq talk2
  end
end

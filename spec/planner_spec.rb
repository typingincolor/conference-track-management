# Talk List Spec
require 'spec_helper'

describe 'planner' do
  it 'can add talks to a session when there is enough time' do
    list = TalkList.new
    list << (Talk.new 'talk one 10min')
    list << (Talk.new 'talk two 20min')

    planner = Planner.new list, [30]

    result = planner.plan

    expect(result[0].talks.length).to eq 2
    expect(result[0].talks[0].description).to eq 'talk one'
    expect(result[0].talks[1].description).to eq 'talk two'
    expect(result[0].talks[0].length).to eq 10
    expect(result[0].talks[1].length).to eq 20
  end
end

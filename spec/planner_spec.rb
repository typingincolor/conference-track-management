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

  it 'can go to a second session when the first is full' do
    list = TalkList.new

    talk1 = Talk.new 'talk one 10min'
    talk2 = Talk.new 'talk two 20min'
    talk3 = Talk.new 'talk three 20min'
    list << talk1 << talk2 << talk3

    planner = Planner.new list, [30, 30]

    result = planner.plan

    result.each do |x|
      puts "#{x}"
      x.talks.each do |y|
        puts y.description
      end
    end

    expect(result.length).to eq 2
    expect(result[0].talks.length).to eq 2
    expect(result[0].talks[0]).to eq talk1
    expect(result[0].talks[1]).to eq talk2
    expect(result[1].talks.length).to eq 1
    expect(result[1].talks[0]).to eq talk3
  end
end

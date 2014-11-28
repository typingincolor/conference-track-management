# Talk List Spec
require 'spec_helper'

describe 'talk' do
  it 'can add a talk to the list' do
    list = TalkList.new

    list << Talk.new('a talk 45min')

    expect(list.size).to eq 1
  end

  it 'can be sorted by descending talk length' do
    list = TalkList.new

    list << Talk.new('a talk 45min')
    list << Talk.new('a talk 60min')

    list.sort!

    expect(list[0]).to eq Talk.new('a talk 60min')
    expect(list[1]).to eq Talk.new('a talk 45min')
  end

  it 'reads a talk list from a file' do
    list = TalkList.new './spec/test_list.txt'

    expect(list.size).to eq 5

    expect(list[0].description).to eq 'Talk one'
    expect(list[1].description).to eq 'Talk two'
    expect(list[2].description).to eq 'Talk three'
    expect(list[3].description).to eq 'Talk four'
    expect(list[4].description).to eq 'Talk five'

    expect(list[0].length).to eq 10
    expect(list[1].length).to eq 25
    expect(list[2].length).to eq 5
    expect(list[3].length).to eq 10
    expect(list[4].length).to eq 15
  end
end

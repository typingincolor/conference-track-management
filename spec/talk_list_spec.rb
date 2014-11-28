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

    expect(list[0]).to eq Talk.new 'Talk one 10min'
    expect(list[1]).to eq Talk.new 'Talk two 25min'
    expect(list[2]).to eq Talk.new 'Talk three lightning'
    expect(list[3]).to eq Talk.new 'Talk four 10min'
    expect(list[4]).to eq Talk.new 'Talk five 15min'
  end

  it 'handles non-existant file' do
    expect { TalkList.new 'rubbishfile' }.to raise_error Errno::ENOENT
  end
end

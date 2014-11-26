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
end

# Talk Spec
require 'spec_helper'

describe 'talk' do
  it 'populates description and length correctly with length specified'\
     ' in minutes' do
    talk = Talk.new('this is a talk 45min')

    expect(talk.description).to eq('this is a talk')
    expect(talk.length). to eq(45)
  end
end

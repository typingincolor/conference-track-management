# Talk Spec
require 'spec_helper'

describe 'talk' do
  it 'populates description and length correctly with length specified'\
     ' in minutes' do
    talk = Talk.new('this is a talk 45min')

    expect(talk.description).to eq('this is a talk 45min')
    expect(talk.length). to eq(45)
  end

  it 'populates description and length correctly with length specified'\
     ' as lightning' do
    talk = Talk.new('this is a talk lightning')

    expect(talk.description).to eq('this is a talk lightning')
    expect(talk.length). to eq(5)
  end

  it 'throws an execption if the format is incorrect' do
    expect { Talk.new('this is a failing talk') }
      .to raise_error 'incorrect format'
  end

  it 'it knows when two talks are the same' do
    talk = Talk.new 'this is a talk 45min'
    talk2 = Talk.new 'this is a talk 45min'

    expect(talk).to eq talk2
  end

  it 'it knows when two talks are different because of length' do
    talk = Talk.new 'this is a talk 45min'
    talk2 = Talk.new 'this is a talk 30min'

    expect(talk).to_not eq talk2
  end

  it 'it knows when two talks are different because of description' do
    talk = Talk.new 'this is a talk 45min'
    talk2 = Talk.new 'this is another talk 45min'

    expect(talk).to_not eq talk2
  end
end

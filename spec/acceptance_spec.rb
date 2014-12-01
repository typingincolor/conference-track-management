# Acceptance Test
require 'spec_helper'

describe 'acceptance' do
  it 'passes the acceptance test' do
    list = TalkList.new './spec/acceptance_file.txt'
    list.sort!

    planner = Planner.new

    result = planner.plan list, [180, 180, 240, 240]

    result.each_with_index do |res, res_index|
      puts "Session #{res_index}"
      res.talks.each_with_index do |talk, talk_index|
        puts "#{talk_index} #{talk.description}"
      end
    end
  end
end

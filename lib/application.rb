# Application
require './lib/planner'
require './lib/session'
require './lib/talk_list'
require './lib/talk'

require 'date'

list = TalkList.new './data/talks.txt'

planner = Planner.new

result = planner.plan list, [180, 180, 240, 240]

result.each_with_index do |res, res_index|
  puts "Session #{res_index}"
  time = DateTime.new(2014, 12, 24, 9, 0, 0, -1) if res_index < 2
  time = DateTime.new(2014, 12, 24, 13, 0, 0, -1) if res_index > 1
  res.talks.each do |talk|
    format = format('%02d:%02d %s', time.hour, time.minute, talk.description)
    puts format
    newtime = time + Rational(talk.length, 1440)
    time = newtime
  end
end

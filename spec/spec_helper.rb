require 'simplecov'
SimpleCov.start do
  add_filter do |src|
    !(src.filename =~ /^#{SimpleCov.root}\/lib/)
  end
end

require_relative '../lib/talk'
require_relative '../lib/session'
require_relative '../lib/talk_list'
require_relative '../lib/planner'

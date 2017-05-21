require "minitest/autorun"
require "minitest/spec"
require "minitest/unit"

require "./lib/boombox.rb"

require 'minitest/reporters'
reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]


class MiniTest::Spec
  class << self
    alias context describe
  end

  def build_message(*args)
    args[1].gsub(/\?/, '%s') % args[2..-1]
  end
end
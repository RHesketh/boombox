require "minitest/autorun"
require "minitest/spec"

require "./lib/lucio.rb"

class MiniTest::Spec
  class << self
    alias context describe
  end

  def build_message(*args)
    args[1].gsub(/\?/, '%s') % args[2..-1]
  end
end
require_relative 'mp3/frame'
require_relative 'mp3/file'
require_relative 'mp3/parser'
require_relative 'mp3/player'
require_relative 'mp3/playlist'

module Boombox
  module MP3
    SAMPLES_PER_FRAME = 1152
    BITS_PER_SAMPLE = 144
  end
end
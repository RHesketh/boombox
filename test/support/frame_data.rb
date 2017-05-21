module Boombox
  module Test
    class FrameData
      def self.valid_header
        frame_sync = "11111111111"  # Mandatory start of every header
        mpeg_version = "11"         # MPEG Version 1
        mpeg_layer = "01"           # MPEG Layer 3
        protection_bit = "0"        # No CRC
        bit_rate = "1011"           # 192kbps
        sampling_rate = "00"        # 44100 Hz
        padding = "0"               # No padding byte
        private_bit = "0"           # ?
        channel_mode = "00"         # Stereo

        (frame_sync +
        mpeg_version +
        mpeg_layer +
        protection_bit +
        bit_rate +
        sampling_rate +
        padding +
        private_bit +
        channel_mode).to_i(2)
      end

      def frame_sync_missing
        frame_sync = "11111111111"  # Mandatory start of every header
        mpeg_version = "11"         # MPEG Version 1
        mpeg_layer = "01"           # MPEG Layer 3
        protection_bit = "0"        # No CRC
        bit_rate = "1011"           # 192kbps
        sampling_rate = "00"        # 44100 Hz
        padding = "0"               # No padding byte
        private_bit = "0"           # ?
        channel_mode = "00"         # Stereo

        (frame_sync +
        mpeg_version +
        mpeg_layer +
        protection_bit +
        bit_rate +
        sampling_rate +
        padding +
        private_bit +
        channel_mode).to_i(2)
      end
    end
  end
end
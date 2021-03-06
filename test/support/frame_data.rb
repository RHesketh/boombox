module Boombox
  module Test
    class FrameData
      class MPEGv1
        def self.valid_header
          frame_sync = "11111111111"  # Mandatory start of every header
          mpeg_version = "11"         # MPEG Version 1
          mpeg_layer = "01"           # MPEG Layer 3
          protection_bit = "0"        # No CRC
          bit_rate = "1011"           # 192kbps
          sampling_rate = "00"        # 44100 Hz
          padding = "1"               # Padding byte
          private_bit = "0"           # ?
          channel_mode = "00"         # Stereo

          (frame_sync + mpeg_version + mpeg_layer + protection_bit + bit_rate +
              sampling_rate + padding + private_bit + channel_mode).split("").each_slice(8).map{|b| b.join.to_i(2)}
        end

        def self.frame_sync_missing
          frame_sync = "10101010101"  # Not all 1s,therefore not valid
          mpeg_version = "11"         # MPEG Version 1
          mpeg_layer = "01"           # MPEG Layer 3
          protection_bit = "0"        # No CRC
          bit_rate = "1011"           # 192kbps
          sampling_rate = "00"        # 44100 Hz
          padding = "0"               # No padding byte
          private_bit = "0"           # ?
          channel_mode = "00"         # Stereo

          (frame_sync + mpeg_version + mpeg_layer + protection_bit + bit_rate +
              sampling_rate + padding + private_bit + channel_mode).split("").each_slice(8).map{|b| b.join.to_i(2)}
        end

        def self.wrong_version
          frame_sync = "11111111111"  # Mandatory start of every header
          mpeg_version = "01"         # Reserved (invalid!)
          mpeg_layer = "01"           # MPEG Layer 3
          protection_bit = "0"        # No CRC
          bit_rate = "1011"           # 192kbps
          sampling_rate = "00"        # 44100 Hz
          padding = "0"               # No padding byte
          private_bit = "0"           # ?
          channel_mode = "00"         # Stereo

          (frame_sync + mpeg_version + mpeg_layer + protection_bit + bit_rate +
              sampling_rate + padding + private_bit + channel_mode).split("").each_slice(8).map{|b| b.join.to_i(2)}
        end

        def self.wrong_layer
          frame_sync = "11111111111"  # Mandatory start of every header
          mpeg_version = "11"         # MPEG Version 1
          mpeg_layer = "00"           # Reserved (invalid!)
          protection_bit = "0"        # No CRC
          bit_rate = "1011"           # 192kbps
          sampling_rate = "00"        # 44100 Hz
          padding = "0"               # No padding byte
          private_bit = "0"           # ?
          channel_mode = "00"         # Stereo

          (frame_sync + mpeg_version + mpeg_layer + protection_bit + bit_rate +
              sampling_rate + padding + private_bit + channel_mode).split("").each_slice(8).map{|b| b.join.to_i(2)}
        end

        def self.no_bitrate_set
          frame_sync = "11111111111"  # Mandatory start of every header
          mpeg_version = "11"         # MPEG Version 1
          mpeg_layer = "01"           # MPEG Layer 3
          protection_bit = "0"        # No CRC
          bit_rate = "0000"           # "Free" bit-rate
          sampling_rate = "00"        # 44100 Hz
          padding = "0"               # No padding byte
          private_bit = "0"           # ?
          channel_mode = "00"         # Stereo

          (frame_sync + mpeg_version + mpeg_layer + protection_bit + bit_rate +
              sampling_rate + padding + private_bit + channel_mode).split("").each_slice(8).map{|b| b.join.to_i(2)}
        end

        def self.bit_rate_error
          frame_sync = "11111111111"  # Mandatory start of every header
          mpeg_version = "11"         # MPEG Version 1
          mpeg_layer = "01"           # MPEG Layer 3
          protection_bit = "0"        # No CRC
          bit_rate = "1111"           # Error (invalid!)
          sampling_rate = "00"        # 44100 Hz
          padding = "0"               # No padding byte
          private_bit = "0"           # ?
          channel_mode = "00"         # Stereo

          (frame_sync + mpeg_version + mpeg_layer + protection_bit + bit_rate +
              sampling_rate + padding + private_bit + channel_mode).split("").each_slice(8).map{|b| b.join.to_i(2)}
        end

        def self.reserved_sample_rate
          frame_sync = "11111111111"  # Mandatory start of every header
          mpeg_version = "11"         # MPEG Version 1
          mpeg_layer = "01"           # MPEG Layer 3
          protection_bit = "0"        # No CRC
          bit_rate = "1011"           # 192kbps
          sampling_rate = "11"        # Reserved (invalid!)
          padding = "0"               # No padding byte
          private_bit = "0"           # ?
          channel_mode = "00"         # Stereo

          (frame_sync + mpeg_version + mpeg_layer + protection_bit + bit_rate +
              sampling_rate + padding + private_bit + channel_mode).split("").each_slice(8).map{|b| b.join.to_i(2)}
        end
      end

      class MPEGv2
        def self.valid_header
          frame_sync = "11111111111"  # Mandatory start of every header
          mpeg_version = "10"         # MPEG Version 2
          mpeg_layer = "01"           # MPEG Layer 3
          protection_bit = "0"        # No CRC
          bit_rate = "1100"           # 128kbps
          sampling_rate = "00"        # 22050 Hz
          padding = "1"               # Padding byte
          private_bit = "0"           # ?
          channel_mode = "00"         # Stereo

          (frame_sync + mpeg_version + mpeg_layer + protection_bit + bit_rate +
              sampling_rate + padding + private_bit + channel_mode).split("").each_slice(8).map{|b| b.join.to_i(2)}
        end

        def self.frame_sync_missing
          frame_sync = "10101010101"  # Not all 1s,therefore not valid
          mpeg_version = "10"         # MPEG Version 2
          mpeg_layer = "01"           # MPEG Layer 3
          protection_bit = "0"        # No CRC
          bit_rate = "1100"           # 128kbps
          sampling_rate = "00"        # 22050 Hz
          padding = "1"               # Padding byte
          private_bit = "0"           # ?
          channel_mode = "00"         # Stereo

          (frame_sync + mpeg_version + mpeg_layer + protection_bit + bit_rate +
              sampling_rate + padding + private_bit + channel_mode).split("").each_slice(8).map{|b| b.join.to_i(2)}
        end

        def self.wrong_version
          frame_sync = "11111111111"  # Mandatory start of every header
          mpeg_version = "01"         # Reserved (invalid!)
          mpeg_layer = "01"           # MPEG Layer 3
          protection_bit = "0"        # No CRC
          bit_rate = "1100"           # 128kbps
          sampling_rate = "00"        # 22050 Hz
          padding = "1"               # Padding byte
          private_bit = "0"           # ?
          channel_mode = "00"         # Stereo

          (frame_sync + mpeg_version + mpeg_layer + protection_bit + bit_rate +
              sampling_rate + padding + private_bit + channel_mode).split("").each_slice(8).map{|b| b.join.to_i(2)}
        end

        def self.wrong_layer
          frame_sync = "11111111111"  # Mandatory start of every header
          mpeg_version = "10"         # MPEG Version 2
          mpeg_layer = "00"           # Reserved (invalid!)
          protection_bit = "0"        # No CRC
          bit_rate = "1100"           # 128kbps
          sampling_rate = "00"        # 22050 Hz
          padding = "0"               # No padding byte
          private_bit = "0"           # ?
          channel_mode = "00"         # Stereo

          (frame_sync + mpeg_version + mpeg_layer + protection_bit + bit_rate +
              sampling_rate + padding + private_bit + channel_mode).split("").each_slice(8).map{|b| b.join.to_i(2)}
        end

        def self.no_bitrate_set
          frame_sync = "11111111111"  # Mandatory start of every header
          mpeg_version = "10"         # MPEG Version 2
          mpeg_layer = "01"           # MPEG Layer 3
          protection_bit = "0"        # No CRC
          bit_rate = "0000"           # "Free" bitrate (invalid!)
          sampling_rate = "00"        # 22050 Hz
          padding = "1"               # Padding byte
          private_bit = "0"           # ?
          channel_mode = "00"         # Stereo

          (frame_sync + mpeg_version + mpeg_layer + protection_bit + bit_rate +
              sampling_rate + padding + private_bit + channel_mode).split("").each_slice(8).map{|b| b.join.to_i(2)}
        end

        def self.bit_rate_error
          frame_sync = "11111111111"  # Mandatory start of every header
          mpeg_version = "10"         # MPEG Version 2
          mpeg_layer = "01"           # MPEG Layer 3
          protection_bit = "0"        # No CRC
          bit_rate = "1111"           # Bit rate error
          sampling_rate = "00"        # 22050 Hz
          padding = "1"               # Padding byte
          private_bit = "0"           # ?
          channel_mode = "00"         # Stereo

          (frame_sync + mpeg_version + mpeg_layer + protection_bit + bit_rate +
              sampling_rate + padding + private_bit + channel_mode).split("").each_slice(8).map{|b| b.join.to_i(2)}
        end

        def self.reserved_sample_rate
          frame_sync = "11111111111"  # Mandatory start of every header
          mpeg_version = "10"         # MPEG Version 2
          mpeg_layer = "01"           # MPEG Layer 3
          protection_bit = "0"        # No CRC
          bit_rate = "1100"           # 128kbps
          sampling_rate = "11"        # Reserved (invalid!)
          padding = "1"               # Padding byte
          private_bit = "0"           # ?
          channel_mode = "00"         # Stereo

          (frame_sync + mpeg_version + mpeg_layer + protection_bit + bit_rate +
              sampling_rate + padding + private_bit + channel_mode).split("").each_slice(8).map{|b| b.join.to_i(2)}
        end
      end
    end
  end
end
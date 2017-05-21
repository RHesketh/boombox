module Boombox
  module MP3
    class Frame
      class Validation
        def self.invalid?(frame_bytes)
          bits = frame_bytes[0..3].map{|b| '%0*b' % [8,b]}.join

          return true unless frame_sync_valid? bits
          return true unless is_mpeg_version_1? bits
          return true unless is_mpeg_layer_3? bits
          return true unless bit_rate_set? bits
          return true if bit_rate_error? bits
          return true if reserved_sample_rate? bits

          return false
        end

        private

        def self.frame_sync_valid?(bits)
          return true if bits[0..10] == "11111111111"
          return false
        end

        def self.is_mpeg_version_1?(bits)
          return true if bits[11..12] == "11" # MPEG version 1
          return false
        end

        def self.is_mpeg_layer_3?(bits)
          return true if bits[13..14] == "01" # Layer III
          return false
        end

        def self.bit_rate_set?(bits)
          return false if bits[16..19] == "0000"  # "Free" bit rate
          return true
        end

        def self.bit_rate_error?(bits)
          return true if bits[16..19] == "1111"   # Bit rate error
          return false
        end

        def self.reserved_sample_rate?(bits)
          return true if bits[20..21] == "11"  # 11 = reserved
          return false
        end
      end
    end
  end
end
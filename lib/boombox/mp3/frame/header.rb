module Boombox
  module MP3
    class Frame
      class Header
        def self.frame_length_in_bytes(header_bytes)
          header_bits = header_bytes.map{|b| '%0*b' % [8,b]}.join

          bit_rate = get_bit_rate(header_bits)
          sample_rate = get_sample_rate(header_bits)
          padding = get_padding(header_bits)

          return BITS_PER_SAMPLE * bit_rate / sample_rate + padding
        end

        def self.bit_rate(header_bytes)
          header_bits = header_bytes.map{|b| '%0*b' % [8,b]}.join
          return get_bit_rate(header_bits)
        end

        def self.sample_rate(header_bytes)
          header_bits = header_bytes.map{|b| '%0*b' % [8,b]}.join
          return get_sample_rate(header_bits)
        end

        def self.padding(header_bytes)
          header_bits = header_bytes.map{|b| '%0*b' % [8,b]}.join
          return get_padding(header_bits)
        end

        private

        def self.mpeg_version(header_bits)
          version_bits = header_bits[11..12]
          return 1 if version_bits == "11"
          return 2 if version_bits == "10"
          return nil
        end

        def self.get_bit_rate(header_bits)
          version = mpeg_version(header_bits)

          if version == 1
            get_version_1_bit_rate(header_bits)
          elsif version == 2
            get_version_2_bit_rate(header_bits)
          else
            raise "Unknown bit rate!"
          end
        end

        def self.get_sample_rate(header_bits)
          mpeg_version = mpeg_version(header_bits)

          if mpeg_version == 1
            get_version_1_sample_rate(header_bits)
          else
            get_version_2_sample_rate(header_bits)
          end
        end

        def self.get_version_1_bit_rate(header_bits)
          bit_rate_bits = header_bits[16..19]

          {
            '0001' => 32000,
            '0010' => 40000,
            '0011' => 48000,
            '0100' => 56000,
            '0101' => 64000,
            '0110' => 80000,
            '0111' => 96000,
            '1000' => 112000,
            '1001' => 128000,
            '1010' => 160000,
            '1011' => 192000,
            '1100' => 224000,
            '1101' => 256000,
            '1110' => 320000
          }[bit_rate_bits] || 0
        end

        def self.get_version_2_bit_rate(header_bits)
          bit_rate_bits = header_bits[16..19]

          {
            '0001' => 8000,
            '0010' => 16000,
            '0011' => 24000,
            '0100' => 32000,
            '0101' => 40000,
            '0110' => 48000,
            '0111' => 56000,
            '1000' => 64000,
            '1001' => 80000,
            '1010' => 96000,
            '1011' => 112000,
            '1100' => 128000,
            '1101' => 144000,
            '1110' => 160000
          }[bit_rate_bits] || 0
        end


        def self.get_version_1_sample_rate(header_bits)
          sample_rate_bits = header_bits[20..21]

          {
            '00' => 44100,
            '01' => 48000,
            '10' => 32000,
          }[sample_rate_bits] || 0
        end

        def self.get_version_2_sample_rate(header_bits)
          sample_rate_bits = header_bits[20..21]

          {
            '00' => 22050,
            '01' => 24000,
            '10' => 16000,
          }[sample_rate_bits] || 0
        end

        def self.get_padding(header_bits)
          header_bits[22].to_i
        end
      end
    end
  end
end
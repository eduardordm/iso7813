require 'iso7812'

module Iso7813

  class Track2

    include Iso7812::CardNumber

    attr_accessor :pan
    attr_accessor :expiration_date
    attr_accessor :service_code

    def stx
      ';'
    end

    def ed
      expiration_date || "="
    end

    def sc
      service_code || "="
    end

    def dd
      "#{stx}#{pan}#{fs}#{ed}#{sc}".length.to_s
    end

    def etx
      "?"
    end

    def fs
      '='
    end

    def lrc(_track)
      raise 'The track printer should do that, not the track generation software (parity)'
    end

    def track(include_lrc_and_sentinel = false)
      _track = "#{stx}#{pan}#{fs}#{ed}#{sc}#{dd}"
      _track << "#{etx}#{lrc(_track)}" if include_lrc_and_sentinel
      _track
    end

    def self.generate(fields = {}, include_lrc_and_sentinel = false)

      track2 = Track2.new
      track2.pan = fields[:pan]
      track2.expiration_date = fields[:expiration_date]
      track2.service_code = fields[:service_code]

      track2.track(include_lrc_and_sentinel)
    end

  end

end
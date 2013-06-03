require 'iso7812'

module Iso7813

  class Track1

    include Iso7812::CardNumber

    def stx
      '%'
    end

    def fc
      'B'
    end

    def fs
      '^'
    end

    attr_accessor :last_name
    attr_accessor :first_name
    attr_accessor :middle_name
    attr_accessor :title
    attr_accessor :pan
    attr_accessor :expiration_date
    attr_accessor :service_code

    def nm
      _nm = "#{last_name}/#{first_name}"
      _nm << " #{middle_name}" unless middle_name.nil?
      _nm << ".#{title}" unless title.nil?
      _nm
    end

    def ed
      expiration_date || "^"
    end

    def sc
      service_code || "^"
    end

    def dd
      "#{stx}#{fc}#{pan}#{fs}#{nm}#{fs}#{ed}#{sc}".length.to_s
    end

    def etx
      "?"
    end

    def lrc(_track)
      raise 'The track printer should do that, not the track generation software (parity)'
    end

    def track(include_lrc_and_sentinel = false)
      _track = "#{stx}#{fc}#{pan}#{fs}#{nm}#{fs}#{ed}#{sc}#{dd}"
      _track << "#{etx}#{lrc(_track)}" if include_lrc_and_sentinel
      _track
    end

    def self.generate(fields = {}, include_lrc_and_sentinel = false)

      track1 = Track1.new
      track1.last_name = fields[:last_name]
      track1.first_name = fields[:first_name]
      track1.middle_name = fields[:middle_name]
      track1.title = fields[:title]
      track1.pan = fields[:pan]
      track1.expiration_date = fields[:expiration_date]
      track1.service_code = fields[:service_code]

      track1.track(include_lrc_and_sentinel)
    end

  end

end
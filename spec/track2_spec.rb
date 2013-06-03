require 'spec_helper'

include Iso7813

describe Track2 do

  it "should correctly create a track2" do

    track = Track2.generate(  { pan: '1234567890123445',
                              expiration_date: '9901',
                              service_code: '101'}, false)

    track.should eq ";1234567890123445=990110125"

  end




end

require 'spec_helper'

include Iso7813

describe Track1 do

  it "should correctly create a track1" do

    track = Track1.generate( {last_name: 'DOE',
                      first_name: 'JOHN',
                      pan:  '1234567890123445',
                      expiration_date: '9901',
                      service_code: '101'}, false)

    track.should eq "%B1234567890123445^DOE/JOHN^990110135"

  end




end

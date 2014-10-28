Calculator.rb

require 'net/http'
require 'json'

info = nil

def display_images (x)
    x.times {
        puts 'some image'    
    }
end

options = { 'Full' => 1,
            'New' => 2,
            'Waxing Gibbous' => 3,
            'Waxing Crescent' => 4,
            'Waning Crescent' => 5,
            'Waning Gibbous' => 6,
            'First Quarter' => 7,
            'Third Quarter' => 8
        }

uri = URI('http://api.wunderground.com/api/cbc10a249484aad6/astronomy/q/NY/new_york.json')

info = JSON.parse(Net::HTTP.get(uri))

print display_images(options[info['moon_phase']['phaseofMoon']])
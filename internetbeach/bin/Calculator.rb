require 'net/http'
require 'json'
require 'sinatra'

uri = URI('http://api.wunderground.com/api/cbc10a249484aad6/astronomy/q/NY/new_york.json')
info = JSON.parse(Net::HTTP.get(uri))
images = Dir[".css/ie/images/*"]
options = { 'Full' => 1,
            'New' => 2,
            'Waxing Gibbous' => 3,
            'Waxing Crescent' => 4,
            'Waning Crescent' => 5,
            'Waning Gibbous' => 6,
            'First Quarter' => 7,
            'Third Quarter' => 8
        }

def display_images (imgs, num)
    html = ''
    num.times do |i| 
        
        html = html.to_s + '<div class=""><img id="img' + i.to_s + '" src="' + imgs[i].to_s + '"></div>'
    end    
    return html
end



set :public_folder, File.dirname(__FILE__) +'.css/ie/images/'

get '/' do
  display_images(images, options[info['moon_phase']['phaseofMoon']])
end
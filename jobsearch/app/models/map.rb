require 'json'
require 'uri'
require 'net/http'

class Map < ActiveRecord::Base
	def self.get_result
		uri = URI('http://api.indeed.com/ads/apisearch?publisher=9586673497533056&q=civil&l=austin&v=2&format=json&latlong=1')
		json = JSON.parse(Net::HTTP.get(uri))
		result = json["results"]
	end
end

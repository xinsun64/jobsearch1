require 'json'
require 'uri'
require 'net/http'
require 'rexml/document'
require 'xmlsimple'
require 'set'

class Map < ActiveRecord::Base
	def self.get_jobs
		uri = URI('http://api.indeed.com/ads/apisearch?publisher=9586673497533056&q=java&l=mountain+view&v=2&format=json&latlong=1')
		json = JSON.parse(Net::HTTP.get(uri))
		result = json["results"]
	end

	def self.get_comps(jobs)
		s = Set.new
		jobs.each { |job|
			s.add(job["company"])
		}
		@comps = s.to_a.sort_by{|word| word.downcase}
	end
  
end

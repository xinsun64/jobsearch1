require 'json'
require 'uri'
require 'net/http'
require 'rexml/document'
require 'xmlsimple'
require 'set'
include REXML

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

	def self.get_permalinks(comps)
		h = Hash.new
		comps.each { |comp|
			begin
				c = comp.gsub(/[ &]/, '+')
				uri = URI('http://api.crunchbase.com/v/2/organizations?query=' + c + '&user_key=300f7644a14557a314f82154661c941a&page=1')
				json = JSON.parse(Net::HTTP.get(uri))
				permalink = json['data']['items'][0]['path']
				# uri = URI('http://api.crunchbase.com/v/2/'+ permalink + '?user_key=300f7644a14557a314f82154661c941a')
				# json = JSON.parse(Net::HTTP.get(uri))
				# description = json['data']['properties']['description']
				h[comp] = permalink
			rescue
				# pass
			end
		}
		return h
	end

end

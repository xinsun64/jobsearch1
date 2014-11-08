require 'net/http'
require 'rexml/document'
require 'xmlsimple'
include REXML

class SearchController < ApplicationController
	def search
		uri = URI('http://api.indeed.com/ads/apisearch?publisher=7860093636562111&q=java&l=austin%2C+tx&sort=&radius=&st=&jt=&start=&limit=1&fromage=&filter=&latlong=1&co=us&chnl=&userip=1.2.3.4&useragent=Mozilla/%2F4.0%28Firefox%29&v=2')
		hash={'keyword'=>'civil','location'=>'austin'
    		}
		urlHead = "http://api.indeed.com/ads/apisearch?publisher=7860093636562111"
		urlMid = "&q="+hash['keyword']+"&l="+hash['location']
		urlTail = "&sort=&radius=&st=&jt=&start=&limit=&fromage=&filter=&latlong=1&co=us&chnl=&userip=1.2.3.4&useragent=Mozilla/%2F4.0%28Firefox%29&v=2"
		url=urlHead+urlMid+urlTail
		url = URI(url)
		res = Net::HTTP.get_response(url)
       case res
       when Net::HTTPSuccess, Net::HTTPRedirection
         results = XmlSimple::xml_in(res.body, 'force_array' => false)
         @jobs_found = results['results']['result']
       else
       	  puts res.error!
       end
		if @jobs_found.nil?
		   @jobs_found=[]
		   flash[:notice] = "No jobs found" 
		 else
		 		session[:jobs] = @jobs_found
		 end  	 

	end

end

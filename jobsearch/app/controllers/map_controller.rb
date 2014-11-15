class MapController < ApplicationController
  def index
  	# @jobs = Map.get_jobs
  	@jobs = session[:jobs]
  	@comps = Map.get_comps(@jobs)
  	gon.jobs = @jobs
  end
end

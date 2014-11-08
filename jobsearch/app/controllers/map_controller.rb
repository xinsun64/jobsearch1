class MapController < ApplicationController
  def index
  	# @result = Map.get_result
  	@result = session[:jobs]
  	gon.result = @result
  end
end

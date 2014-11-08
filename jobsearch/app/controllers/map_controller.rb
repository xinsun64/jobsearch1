class MapController < ApplicationController
  def index
  	@result = Map.get_result
  	gon.result = @result
  end
end

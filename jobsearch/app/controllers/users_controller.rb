class UsersController < ApplicationController

  def index

  end

  def login
    @user = User.koala(request.env['omniauth.auth']['credentials'])
    @location = @user['location']
    @data = @user['likes']
    @keyword = @data['data']
	end

end
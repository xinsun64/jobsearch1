class User < ActiveRecord::Base

  def self.koala(auth)
    access_token = auth['token']
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,location,likes.limit(1)")
    @location = facebook.location
    if facebook.likes.category == "Interests"
    	@Interests = facebook.likes.name
    else
    	@Interests = nil
    end
  end

end
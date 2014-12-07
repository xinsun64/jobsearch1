class User < ActiveRecord::Base

  def self.koala(auth)
    access_token = auth['token']
    facebook = Koala::Facebook::API.new('CAACEdEose0cBANJfM1EHhUzkc43oFB2TC5IHyzkh7NZCpBt0ebbTjX9d25QONQED2hcDGytz2uTYnFUnaZBsUZAyzquL6L4uSeP2pCqSAZAkYZCT7hXYPkRhKGfec06FPgtk5Yyaib36ZAoCMhSZCEi2dDRUamYNo10fYpNpjNBbMbpXxMlayKa0SC07YLTkToe9KayFFRcupIJZC4KBx5mAfU4vdIqZBsNkZD')
    facebook.get_object("me?fields=name,id,location,likes{name}")
  
  end

end
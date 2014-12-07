class User < ActiveRecord::Base

  def self.koala(auth)
    access_token = auth['token']
    facebook = Koala::Facebook::API.new('CAACEdEose0cBAKszUQZCUA87ZAp2vtJvnh2XrRWEWVotPqqTmdlEW1BgdpIt0l1m51AZByKZApypHM3H1xdZC7ZBo8lGiHwH0I9COQYhuVmLW3MEm1JTISOXCdSH2putKpXjPSigL6eBA3d041u8PKksnYROa69YEjzZAkPDZC5N4vb1VhgADZBelhy7hCnPaUeWCd7hcNHqNXoQiaSRNvFDl')
    facebook.get_object("me?fields=name,id,location,likes{name}")
  
  end

end
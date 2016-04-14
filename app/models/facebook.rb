class Facebook
  def self.get(access_token:)
    user = Koala::Facebook::API.new(access_token)
    user = Hashie::Mash.new(user.get_object("me"))

    user
  end
end

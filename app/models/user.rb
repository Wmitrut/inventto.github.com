class User < ActiveRecord::Base
  attr_accessible :nome, :uid, :provider, :image, :developer

  def self.from_omniauth(auth)
    user = find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
    if user and img = auth["info"]["image"]
      user.image = img
      user.save
    end
    user
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.image = auth["info"]["image"]
    end
  end
end

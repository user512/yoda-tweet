class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    User.where(uid: auth["uid"]).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    user = User.new

    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.name = auth["info"]["nickname"]
    user.token = auth["credentials"]["token"]
    user.secret = auth["credentials"]["secret"]
    user.save
  end
end

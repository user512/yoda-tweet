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
    user
  end

  def tweet(tweet)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]
      config.consumer_secret     = ENV["TWITTER_API_SECRET"]
      config.access_token        = token
      config.access_token_secret = secret
    end

    client.update(tweet)
  end

end

module UsersHelper

  def yodaish(tweet)
    Yodaspeak.credentials(ENV["YODASPEAK_API_KEY"])
    Yodaspeak.speak(tweet).body
  end

  def tweet(tweet)

  end

end

class SessionsController < ApplicationController
  def create
    puts "----------------------------------------\n"
    puts env["omniauth.auth"].to_yaml
    puts "----------------------------------------\n"

    auth = env["omniauth.auth"]
    provider = auth[:provider]
    uid = auth[:uid]
    user = User.find_by(:provider => provider, :uid => uid) || User.create_with_omniauth(auth)
    session[:uid] = uid

    puts "----------------------------------------\n"
    puts session
    puts "----------------------------------------\n"
    puts request
    puts "----------------------------------------\n"

    redirect_to root_url, :notice => "Signed in!"
  end


  def destroy
    logout
    redirect_to root_url
  end


  def tweet
    puts 'hello'

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "rokeumwekNcqPhXpgRzRA1ni1"
      config.consumer_secret     = "jw0IcrTU4NRTVLGQp4osrTAGGSY1voTauNWxjGBejwjRuIvZmA"
      config.access_token        = "3279416149-A8oH7l2S9O3wFS4yye8gwwqzzV3t8KEt85FK8Ah"
      config.access_token_secret = "6U6QVbsbJgLyqm0ldKuofrA0cvuwwnX7yoCd21OjVsadl"
    end

    now = Time.now
    timestr = "#{now.year}/#{now.month}/#{now.day} #{now.hour}:#{now.min}:#{now.sec}"
    client.update('これは自動ツイートのてすと ' + timestr)

    redirect_to root_url
  end
  
end



Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,  'rokeumwekNcqPhXpgRzRA1ni1', 'jw0IcrTU4NRTVLGQp4osrTAGGSY1voTauNWxjGBejwjRuIvZmA'
  provider :facebook, '1592913730989299', '1c1febe5e95dfc079ce1f8d748081808', { 
    :scope => 'email,public_profile' 
  }
  provider :google_oauth2, '280496559896-gmc3h1lji778147kn8ndbnqfh8278sok.apps.googleusercontent.com', 'uA62q6axC75g1lIm5J9Y_xsu', {
    :scope => 'email,profile' 
  }
  provider :mixi, '98a8cfcfca1d3edf755d', 'b052e294f86feb68f0450de4a87866ce6b778a06' 
end




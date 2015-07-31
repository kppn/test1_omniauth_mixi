class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    puts "Creation!!!!!!\n"
    create! do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.name = auth[:info][:nickname] || auth[:info][:name]

      puts "------------------------------\n"
      puts auth
      puts auth[:info][:name]
      puts user.name
      puts "------------------------------\n"
    end
  end
end

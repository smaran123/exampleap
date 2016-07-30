class User < ActiveRecord::Base

# def self.from_omniauth(auth)
# 	where(auth.slice(:provider,:uid)).first_or_initialize.tap do |user|
# 		user.provider = auth.provider
# 		user.name = auth.info.name
# 		user.oauth_token = auth.credentials.token
# 		user.oauth_expire_at = Time.at(auth.credentials.expires_at)
# 				user.save!
# 	end
# end






    def self.from_omniauth(auth_hash)
      unless user = User.find_by_email(auth_hash['info']['email'])
        email = auth_hash['info']['email']
        provider = auth_hash['provider']
        uid = auth_hash['uid']
        secret = auth_hash['secret']
        details = auth_hash
        token = auth_hash['credentials'].try(:"[]", "token")
        user = User.new :email => email, :details => details, :uid => uid, :provider => provider, :secret => secret, :oauth_token => token
        user.save(:validate => false)
      end
      return user
    end




# def self.from_omniauth(auth_hash)
#       unless user = User.find_by_email(auth_hash['info']['email'])
#         email = auth_hash['info']['email']
#         provider = auth_hash['provider']
#         uid = auth_hash['uid']
#         secret = auth_hash['secret']
#         details = auth_hash
#         token = auth_hash['credentials'].try(:"[]", "token")
#         user = User.new :email => email, :confirmation_token => nil, :details => details, :confirmed_at => Time.now, :uid => uid, :provider => provider, :secret => secret, :oauth_token => token
#         user.save(:validate => false)
#       end
#       return user
# end


    def facebook
      @facebook ||= Koala::Facebook::API.new(oauth_token)
      block_given? ? yield(@facebook) : @facebook
    rescue Koala::Facebook::APIError => e
      logger.info.e.to_s
      nil
    end

    def friends_count
      facebook { |fb| fb.get_connection("me","friends").size }
end
end

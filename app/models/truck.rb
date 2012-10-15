class Truck < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :description, :name, :provider, :uid, :twitter_auth_token, :twitter_auth_token_secret
  has_many :stops

  validate :email_or_uid_present
  
  def email_or_uid_present
  	uid.present? || email.present?
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
  	truck = Truck.where(:provider => auth.provider, :uid => auth.uid).first
  	unless truck
  		truck = Truck.create!(name:auth.extra.raw_info.name,
				  			provider:auth.provider,
				  			uid:auth.uid,
				  			email:auth.info.email,
				  			password:Devise.friendly_token[0,20],
			  			    :twitter_auth_token => (auth.credentials.token rescue nil),
			  			    :twitter_auth_token_secret => (auth.credentials.secret rescue nil)
			  			)
  	end
  	truck
  end

  def tweet(status)
  	if twitter_auth_token.present? && twitter_auth_token_secret.present?
  		client = Twitter::Client.new(:oauth_token => twitter_auth_token, :oauth_token_secret => twitter_auth_token_secret) rescue nil
  		client.update(status) if client
  	end
  end

end

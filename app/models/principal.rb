class Principal < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :omniauthable

  attr_accessible :twitter_auth_token, :twitter_auth_token_secret, :provider, :email, :password, :uid

  has_one :truck

  validate :email_or_uid_present
  
  def email_or_uid_present
  	uid.present? || email.present?
  end

  def self.find_or_create_for_twitter_oauth(auth)
  	principal = Principal.where(:provider => auth.provider, :uid => auth.uid).first
  	unless principal
  		principal = Principal.new(
  			provider:auth.provider,
  			uid:auth.uid,
  			email:auth.info.email,
  			password:Devise.friendly_token[0,20],
  			twitter_auth_token:(auth.credentials.token rescue nil),
  			twitter_auth_token_secret:(auth.credentials.secret rescue nil)
		)
  		principal.create_truck(
  			name:auth.extra.raw_info.name
		)
  		principal.save
  	end
  	principal
  end
end

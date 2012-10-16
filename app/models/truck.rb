class Truck < ActiveRecord::Base

  # Setup accessible (or protected) attributes for your model
  attr_accessible :description, :name
  has_many :stops
  belongs_to :principal

  def tweet(status)
  	if twitter_auth_token.present? && twitter_auth_token_secret.present?
  		client = Twitter::Client.new(
  			:oauth_token => principal.twitter_auth_token,
  			:oauth_token_secret => principal.twitter_auth_token_secret
  		) rescue nil
  		client.update(status) if client
  	end
  end

end

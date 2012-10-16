class RemoveFieldsFromTrucks < ActiveRecord::Migration
  def change
  	remove_column :trucks, :email
  	remove_column :trucks, :encrypted_password
  	remove_column :trucks, :reset_password_token
  	remove_column :trucks, :reset_password_sent_at
  	remove_column :trucks, :remember_created_at
  	remove_column :trucks, :sign_in_count
  	remove_column :trucks, :current_sign_in_at
  	remove_column :trucks, :last_sign_in_at
  	remove_column :trucks, :current_sign_in_ip
  	remove_column :trucks, :last_sign_in_ip
  	remove_column :trucks, :provider
  	remove_column :trucks, :uid
  	remove_column :trucks, :twitter_auth_token
  	remove_column :trucks, :twitter_auth_token_secret

  end
end
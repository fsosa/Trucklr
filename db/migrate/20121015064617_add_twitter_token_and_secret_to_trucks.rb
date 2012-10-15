class AddTwitterTokenAndSecretToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :twitter_auth_token, :string
    add_column :trucks, :twitter_auth_token_secret, :string
  end
end

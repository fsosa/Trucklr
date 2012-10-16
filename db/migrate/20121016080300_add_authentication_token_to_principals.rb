class AddAuthenticationTokenToPrincipals < ActiveRecord::Migration
  def change
    add_column :principals, :authentication_token, :string
  end
end

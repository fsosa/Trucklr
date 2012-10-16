class CreatePrincipals < ActiveRecord::Migration
  def change
    create_table :principals do |t|
	    t.string   "email"
	    t.string   "encrypted_password",        :default => "", :null => false
	    t.string   "reset_password_token"
	    t.datetime "reset_password_sent_at"
	    t.datetime "remember_created_at"
	    t.integer  "sign_in_count",             :default => 0
	    t.datetime "current_sign_in_at"
	    t.datetime "last_sign_in_at"
	    t.string   "current_sign_in_ip"
	    t.string   "last_sign_in_ip"
	    t.string   "provider"
	    t.string   "uid"
	    t.string   "twitter_auth_token"
	    t.string   "twitter_auth_token_secret"
	    t.timestamps
	end
	
	add_index "principals", ["email"], :name => "index_principals_on_email", :unique => true
	add_index "principals", ["reset_password_token"], :name => "index_principals_on_reset_password_token", :unique => true
      
  end
end

class AddOmniAuthToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :provider, :string
    add_column :trucks, :uid, :string
  end
end

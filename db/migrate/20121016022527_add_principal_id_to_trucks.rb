class AddPrincipalIdToTrucks < ActiveRecord::Migration
  def change
    add_column :trucks, :principal_id, :integer
  end
end

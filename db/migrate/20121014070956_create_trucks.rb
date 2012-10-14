class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :email
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end

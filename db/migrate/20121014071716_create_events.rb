class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :truck_id
      t.timestamp :start_time
      t.timestamp :end_time
      t.column :coordinates, :point
      t.string :location
      t.string :tweet_text

      t.timestamps
    end
  end
end

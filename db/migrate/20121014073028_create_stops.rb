class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.integer :truck_id
      t.timestamp :start_time
      t.timestamp :end_time
      t.float :latitude
      t.float :longitude
      t.string :location
      t.string :tweet_text

      t.timestamps
    end
  end
end

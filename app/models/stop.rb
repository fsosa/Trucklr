class Stop < ActiveRecord::Base
  attr_accessible :end_time, :latitude, :location, :longitude, :start_time, :truck_id, :tweet_text
  belongs_to :truck
  
end

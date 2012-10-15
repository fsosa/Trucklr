class Stop < ActiveRecord::Base
  attr_accessible :end_time, :latitude, :location, :longitude, :start_time, :truck_id, :tweet_text
  belongs_to :truck
  scope :upcoming, lambda { where('end_time >= ?', Time.now) }
end

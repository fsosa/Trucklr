class Stop < ActiveRecord::Base
  attr_accessible :end_time, :latitude, :location, :longitude, :start_time, :truck_id, :tweet_text
  belongs_to :truck

  validates_presence_of :latitude, :longitude, :location, :start_time, :end_time, :truck_id

  scope :upcoming, lambda { where('end_time >= ?', Time.now) }

end

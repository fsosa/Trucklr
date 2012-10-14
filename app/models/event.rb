class Event < ActiveRecord::Base
  attr_accessible :coordinates, :end_time, :location, :start_time, :truck_id, :tweet_text
end

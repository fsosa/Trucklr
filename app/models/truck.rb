class Truck < ActiveRecord::Base
  attr_accessible :description, :email, :name
  has_many :stops

end

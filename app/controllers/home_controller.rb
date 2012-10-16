class HomeController < ApplicationController
	def index
		if current_truck
			redirect_to me_trucks_path
		end
	end
end

class Trucks::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @truck = Truck.find_for_twitter_oauth(request.env["omniauth.auth"], current_truck)

    if @truck.persisted?
      sign_in_and_redirect @truck, :event => :authentication #this will throw if @truck is not activated
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_truck_registration_url
    end
  end
end
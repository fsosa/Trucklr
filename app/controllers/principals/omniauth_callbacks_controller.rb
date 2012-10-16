class Principals::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter

    @principal = Principal.find_or_create_for_twitter_oauth(request.env["omniauth.auth"])

    if @principal.persisted?
      sign_in_and_redirect @principal, :event => :authentication #this will throw if @principal is not activated
      set_flash_message(:notice, :success, :kind => "Twitter") if is_navigational_format?
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_principal_registration_url
    end
  end
end
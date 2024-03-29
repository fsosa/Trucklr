class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    if request.format == :html
      redirect_to main_app.root_path, :alert => exception.message and return
    end
    render :status => 401, :json => {:error => exception.message}
  end

  def current_ability
    @current_ability ||= Ability.new(current_principal)
  end

  def current_truck
  	current_principal && current_principal.truck
  end


end

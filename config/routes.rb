require 'api_constraints'

Trucklr::Application.routes.draw do

  devise_for :principals, :controllers => { :omniauth_callbacks => "principals/omniauth_callbacks" }, :path => ''
  devise_scope :principals do
    get '/auth/:provider' => 'principals/omniauth_callbacks#passthru'
  end

  #for now we are just doing things server-side, soon we will switch to a pure API though.
  namespace 'api', :defaults => {format: 'json'} do
    scope module: 'v1', constraints: ApiConstraints.new(version: 1, default: true) do
      resources :stops, :only => [:index, :create, :show, :update, :destroy]

      resources :trucks , :only => [:index, :create, :show, :update, :destroy] do

        collection do
          get 'profile'
        end

      end
    end
  end
  
  root :to => 'home#index'
  match '*path', to: 'home#index'

end

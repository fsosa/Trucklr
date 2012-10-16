Trucklr::Application.routes.draw do

  devise_for :principals, :controllers => { :omniauth_callbacks => "principals/omniauth_callbacks" }, :path => ''
  #for now we are just doing things server-side, soon we will switch to a pure API though.
  # scope 'api' do
    # scope 'v1' do
      resources :stops, :only => [:index]
      resources :trucks do
        resources :stops
        collection do
          get 'me'
        end
      end
    # end
  # end

  root :to => 'home#index'
  
  match '*path', to: 'home#index'

end

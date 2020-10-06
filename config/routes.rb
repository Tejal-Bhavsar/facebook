Rails.application.routes.draw do
  devise_for :users
 
  namespace :api do
    namespace :v1 do
      # resources :users
      root to: "home#index"
      post 'authenticate', to: 'authentication#authenticate'
    end
  end
end

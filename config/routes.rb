Rails.application.routes.draw do
  root "profile_pages#index"


#  get '/user_profile/index'
  get "/user_profile", to: "user_profile#index"
  
  get '/user_profile/edit'
  post '/user_profile/update'
  

  #get '/user_skill/index'
  get "/user_skill", to: "user_skill#index"
  get '/user_skill/edit'
  get '/signup', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
end

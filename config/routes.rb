Rails.application.routes.draw do
  get 'profile_pages/profile_edit'
  get 'profile_pages/skill_edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "profile_pages#index"
end

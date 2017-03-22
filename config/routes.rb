Rails.application.routes.draw do
  resources :etypes
  resources :muscles
  resources :equipment
  resources :exercises

  root :to => "exercises#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

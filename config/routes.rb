Rails.application.routes.draw do
  resources :exercises

  root :to => "exercises#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

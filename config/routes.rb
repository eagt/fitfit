Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "users#index"

      resources :users do
      member do
        get :delete
      end
      collection do
        get :login
      end
      resources :exercises do
        member do
          get :delete
        end
      end 
      resources :etypes do
        member do
          get :delete
        end
      end
      resources :muscles do
        member do
          get :delete
        end
      end
      resources :equipment do
        member do
          get :delete
        end
      end
      resources :workouts do
        member do
          get :delete
        end
      end
      resources :routines do
        member do
          get :delete
        end
      end
      resources :measurements do
        member do
          get :delete
        end
      end

    end
end
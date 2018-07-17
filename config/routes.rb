Rails.application.routes.draw do
  root "trucks#index"
  devise_for :users do
    resources :reviews
  end

  namespace :api do
    namespace :v1 do
      resources :trucks, only: [:index, :show] do
        resources :reviews, only: [:create] do
          resources :votes, only: [:create, :destroy]
          end
        end
      end
    end


  namespace :admin do
    resources :truck
    resources :users
  end

  resources :trucks do
    resources :reviews
  end
end


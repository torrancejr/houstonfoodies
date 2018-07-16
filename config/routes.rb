Rails.application.routes.draw do
  root "trucks#index"
  devise_for :users
end

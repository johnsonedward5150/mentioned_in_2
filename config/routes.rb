Rails.application.routes.draw do
  devise_for :users
  resources :mentions

  root "mentions#index"
end

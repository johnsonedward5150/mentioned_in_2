Rails.application.routes.draw do
  resources :mentions

  root "mentions#index"
end

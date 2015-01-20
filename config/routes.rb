Rails.application.routes.draw do
  get 'profiles/show'

  devise_for :users
  
  resources :mentions do
  	member do
  		put "like", to: "mentions#upvote"
  	end
  end

  root "mentions#index"

  get '/:id', to: 'profiles#show', as: 'profile'

end

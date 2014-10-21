Rails.application.routes.draw do
  devise_for :users
  resources :mentions do
  	member do
  		put "like", to: "mentions#upvote"
  	end
  end

  root "mentions#index"

  	get '/mentions/mymentions' => 'mentions#mymentions' # or match for older Rails versions
	resources :mentions
end

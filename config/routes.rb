Rails.application.routes.draw do

	devise_for :users

	root 'home#top'
  	get 'home/about'

  	resources :users, only: [:show,:index,:edit,:update] do
  		member do
  			get :following, :followers
  			end
  		end
  	resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
  		resources :book_comments, only: [:create, :destroy]
  	end

  	post '/favorite/:book_id' => 'favorites#create', as:'create'
  	delete '/favorite/:book_id' => 'favorites#destroy', as:'destroy'

  	resources :relationships, only: [:create, :destroy]

end

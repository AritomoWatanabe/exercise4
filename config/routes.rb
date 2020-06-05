Rails.application.routes.draw do

	devise_for :users

	root 'home#top'
  	get 'home/about'

  	post   '/favorite/:book_id' => 'favorites#favorite',   as: 'favorite'
  	delete '/favorite/:book_id' => 'favorites#unfavorite', as: 'unfavorite'

  	resources :users, only: [:show,:index,:edit,:update]
  	resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]


end

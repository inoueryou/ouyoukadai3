Rails.application.routes.draw do
	get 'home/about'
	devise_for :users
	resources :books,only: [:new, :create, :index, :show, :destroy, :edit, :update] do
		resource :favorites, only: [:create, :destroy]
		resources :book_comments,only: [:create, :destroy]
	end
	root 'home#top'
  resources :users,only: [:show,:index,:edit,:update]
end
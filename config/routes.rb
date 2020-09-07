Rails.application.routes.draw do
	get 'home/about'
	devise_for :users
	resources :books,only: [:new, :create, :index, :show, :destroy, :edit, :update] do
		resource :favorites, only: [:create, :destroy]
		resources :book_comments,only: [:create, :destroy]
	end
	post "relationships/:id" => "relationships#create", as: "follow"
	delete "relationships/:id" => "relationships#destroy", as: "unfollow"
	root 'home#top'
	get 'follower_users/:id' => "users#follower_users", as: "followers"
	get 'follow/:id' => "users#follow", as: "follows"
  resources :users,only: [:show,:index,:edit,:update]
end
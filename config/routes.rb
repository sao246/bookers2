Rails.application.routes.draw do

  root :to => 'homes#top', as: 'root'
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users
  resources :books, only: [:new, :index, :show, :create, :destroy, :edit, :update]
  resources :users, only: [:create, :show, :edit, :update, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

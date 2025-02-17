Rails.application.routes.draw do
  resources :books, only: [:new, :index, :show, :create]
  root to: 'homes#top', as: 'top'
  get 'home/about' => 'homes#about', as: 'about'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

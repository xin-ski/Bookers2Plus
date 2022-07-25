Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get "/home/about" => "homes#about", as: "about"
  resources :users
  resources :books do
    resource :favorites, only: [:create, :destroy] #いいね機能についての追記
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
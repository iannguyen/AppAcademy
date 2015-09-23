Rails.application.routes.draw do
  resources :users
  resources :subs
  resource :post, only: [:new]
  resources :posts, except: [:index, :new]
  resource :session, only: [:create, :new, :destroy]
end

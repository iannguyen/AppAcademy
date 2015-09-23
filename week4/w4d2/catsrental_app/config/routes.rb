Rails.application.routes.draw do
  resources :cats
  resources :cat_rental_requests, as: :rentals do
    member do
      post :approve
    end
  end
end

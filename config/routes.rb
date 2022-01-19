Rails.application.routes.draw do
  resources :carriers
  resources :country_distances
  resources :packages
  resources :deliveries
end

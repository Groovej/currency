Currency::Application.routes.draw do
  resources :currency_types

  resources :countries 

  match "countries/new" => 'countries#new', via: [:get, :post]
  get 'initial_data', to: 'countries#currencies', defaults: { format: 'json' }
  root 'home#index'
end

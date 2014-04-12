Rails.application.routes.draw do
  resources :purchase_files, only: [:index, :new, :create]

  root "purchase_files#index"
end

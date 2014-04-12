Rails.application.routes.draw do
  resources :purchase_files, only: [:index, :new]

  root "purchase_files#index"
end

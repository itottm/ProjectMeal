Rails.application.routes.draw do
  resources :catalogues
  root "catalogues#index"
end

Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show]
  get 'restautants', to: 'restautants#index'
end

Tripblink::Application.routes.draw do
  root to: 'homes#index', via: :get
  devise_for :users
  resources :countries, only: [:new, :create, :edit, :index, :update, :destroy]
end

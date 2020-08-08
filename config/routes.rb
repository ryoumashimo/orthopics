Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
  resources :users, only: [:edit, :update, :show]
  resources :posts do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end

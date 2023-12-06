Rails.application.routes.draw do
  resources :users do
    resources :friends
    resources :posts do
      resources :comments
      resources :likes
    end
  end
  root 'users#index'
end

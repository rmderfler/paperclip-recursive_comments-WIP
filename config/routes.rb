Rails.application.routes.draw do
  root to: 'links#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'sessions/new'

  resources :users
  resources :sessions
  resources :votes

  resources :users do
    resources :links
  end

  resources :links do
    resources :photos
  end

  resources :links do
    resources :comments
  end


  resources :comments, :only => [:index, :show] do
    resources :comments
  end
  

  

  
  resources :photos, :only => [:index, :show] do
    resources :photos
  end

end

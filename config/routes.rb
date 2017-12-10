Rails.application.routes.draw do
  root 'movies#index'

  resources :movies do
    collection do
      get :rest
      post :change_count
    end
  end

  resource :cart, only: [:show] do
    put 'add/:movie_id', to: 'carts#add', as: :add_to
    put 'remove/:movie_id', to: 'carts#remove', as: :remove_from
    member do
      post :buy
    end
  end

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' },
             controllers: { registrations: 'users/registrations' }

  resources :users, only: [:index] do
    member do
      get :movies
    end
  end

  resources :roles, only: [:new, :create] do
    collection do
      post :change_role
    end
  end

  resources :feedbacks, only: [:new, :create]

  mount Commontator::Engine => '/commontator'
end

Rails.application.routes.draw do
  # Temporary root_path
  root 'mockups#index'

  # User sessions
  get    'login',  to: 'user_sessions#new'
  post   'login',  to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  # User sign up
  get  'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  # Resources
  resources :stories, only: [:new, :create, :show, :index] do
    resource :location, only: [:create]
  end

  # Mockups
  get 'mockups/index'
  get 'mockups/posts'
  get 'mockups/login'
  get 'mockups/signup'
end

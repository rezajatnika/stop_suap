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
    resources :comments, only: :create
  end

  resources :contacts, only: [:new, :create]

  # Account settings
  scope '/account' do
    get  'settings',        to: 'users#edit'
    get  'change_password', to: 'settings/passwords#show'
    post 'change_password', to: 'settings/passwords#create'
  end

  # Map data from Api
  namespace :api do
    namespace :v1 do
      get 'map_data', to: 'locations#map_data'
    end
  end

  # Mockups
  get 'mockups/index'
  get 'mockups/posts'
  get 'mockups/login'
  get 'mockups/signup'
end

Rails.application.routes.draw do
  # Temporary root_path
  root 'mockups#index'

  # User sessions
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  # Mockups
  get 'mockups/index'
  get 'mockups/posts'
  get 'mockups/login'
  get 'mockups/signup'
end

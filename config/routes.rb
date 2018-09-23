Rails.application.routes.draw do
  post 'users/signin' => 'user_token#create'
  post 'users/signup', to: 'users#create'
  get 'users/all', to: 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

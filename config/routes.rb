Rails.application.routes.draw do

  get 'welcome/index'
  root 'welcome#index'
  devise_for :users, controllers: {
     omniauth_callbacks: "users/omniauth_callbacks"
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

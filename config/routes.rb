Rails.application.routes.draw do
  get 'users/index' => "users#index"
  get "signup" => "users#new"
  get 'users/:id' => "users#show"
  get 'users/:id/edit' => "users#edit"
  post "users/create" => "users#create"
  post "users/:id/update" => "users#update"
  
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  
  get 'posts/index'
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/create" => "posts#create"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  get '/' => "home#top"
  get 'about' => "home#about"
  
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
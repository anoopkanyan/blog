Rails.application.routes.draw do
 
  devise_for :users
  resources :posts
  resources :projects  
  resources :contacts, only: [:new, :create]
  resources :tags

  get "/pages/*page" => "pages#show"
  get 'welcome/index'
  root 'welcome#index'
 
  get '*path' => redirect('/')

end

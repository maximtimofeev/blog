Rails.application.routes.draw do
  resources :users
  resources :posts
  root 'app#index'

  get 'posts/page/(:page(.:format))', to: 'posts#index'
  
  get 'app/index'
  get 'app/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

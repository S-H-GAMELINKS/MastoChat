Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'web#index'
  get 'web/index'
  get '/about',   to: 'web#index'
  get '/contact',   to: 'web#index'
  get '/chats',   to: 'web#index'
  get '/chats/rooms/:id',   to: 'web#index'
  match '/chats/rooms/:id', :to => "web#index", :via => :get

  namespace :api, format: 'json' do
    resources :chat
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

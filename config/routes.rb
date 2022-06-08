Rails.application.routes.draw do
  devise_for :admin,skip: [:registrations, :passwords],  controllers: {
  sessions: "admin/sessions"
}

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

namespace :admin do
  get "/homes" => "homes#top"
  resources :items
  resources :genres,        only:[:index, :create, :edit, :update]
  resources :customers,     only:[:index, :show, :edit, :update]
  resources :orders,        only:[:show, :update]
  resources :order_details, only:[:update]
end

scope module: :public do
  root to:'homes#top'
  get "/homes" => "homes#top"
  get "/homes/about" => "homes#about"

  resources :items,         only:[:index, :show]

  resource :customers,     only:[:show, :edit, :update]
  get "/customers/confirm" => "customers#confirm"
  patch "/customers/withdrawal" => "customers#withdrawal"

  resources :cart_items,    only:[:index, :update, :destroy, :create]
  delete "/cart_items/destroy_all" => "cart_items#destroy_all"

  resources :orders,        only:[:new, :create, :index, :show] do
    collection do
  get "/confirm" => "orders#confirm"
  get "/conpletion" => "orders#conpletion"
end
end
  resources :addresses,     only:[:index, :edit, :create, :update, :destroy]
end
  #devise_for :admins
  #devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

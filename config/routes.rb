Rails.application.routes.draw do
  get 'inquiry/index' =>'inquiry#index'
  post 'inquiry/confirm' =>'inquiry#confirm'
  post 'inquiry/complete' =>'inquiry#complete'
  devise_for :customers, path: "customer", controllers: {
    registrations: "customers/registrations",
    sessions: "customers/sessions"
  }

  devise_for :admins, path: "admin", controllers: {
    registrations: 'admins/registrations',
    sessions: 'admins/sessions'
  }

  namespace :admin do
    get '', :to => 'homes#top'
    resources :items
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    get 'customers/confirm'
    patch 'customers/withdrawal'
    delete 'cart_items/destroy_all'
    delete 'favorites/destroy_all'
    post 'orders/confirm'
    get 'orders/complete'
    resources :items, only:[:show]
    resource :customers, only:[:show, :edit, :update]
    resources :cart_items, only:[:index, :destroy, :create]
    resources :favorites, only:[:index, :destroy, :create]
    resources :orders, only:[:new, :create, :index, :show]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

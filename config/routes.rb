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
    resources :items, only:[:show]
    resource :customers, only:[:show, :edit, :update] do
      collection do
        get 'confirm'
        patch 'withdrawal'
      end
    end
    resources :cart_items, only:[:index, :destroy, :create]
    resources :favorites, only:[:index, :destroy, :create]
    resources :orders, only:[:new, :create, :index, :show] do
      collection do
        post 'confirm'
        get 'complete'
      end
    end
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

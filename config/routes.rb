Rails.application.routes.draw do

  namespace :public do
    get 'plans/index'
    get 'plans/show'
  end
  namespace :admin do
    get 'order_details/show'
  end
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes#about', as: 'about'
    get 'customers/:id/mypage' => 'customers#show', as: 'mypage'
    get 'customers/information/:id/edit' => 'customers#edit', as: 'edit_information'
    patch 'customers/information:id/' => 'customers#update', as: 'update_information'
    get 'customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    patch 'customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/confirm' => 'orders#error'
    get 'orders/thanks' => 'orders#thanks', as: 'thanks'
    post 'reserves/confirm' => 'reserves#confirm'
    get 'reserves/confirm' => 'reserves#error'
    post 'reserves/complete' => 'reserves#complete', as: 'complete'

    resources :courses, only:[:index, :show]
    resources :menus, only:[:index, :show]
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:index, :create, :update, :destroy]
    resources :items, only:[:new, :index, :create, :show]
    resources :orders, only:[:new, :index, :show, :create]
    resources :plans, only:[:index, :show] do
      resources :reserves, only:[:new, :show, :create, :update]
    end
    resources :reserves, only:[:index]
    resources :institutions, only:[:index, :show]
    resources :addresses, only:[:index, :create, :edit, :update, :destroy]
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    get 'homes/top' => 'homes#top', as: 'top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :courses, only:[:new, :index, :create, :show, :edit, :update]
    resources :menus, only:[:new, :index, :create, :show, :edit, :update]
    resources :menu_genres, only:[:index, :create, :edit, :update]
    resources :items, only:[:new, :index, :create, :show, :edit, :update]
    resources :item_genres, only:[:index, :create, :edit, :update]
    resources :plans, only:[:new, :index, :create, :show, :edit, :update]
    resources :reserves, only:[:show, :update]
    resources :institutions, only:[:new, :index, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update] do
      resources :order_details, only: [:update]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

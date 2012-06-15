Artemis::Application.routes.draw do

  authenticated :user do
    root to: 'users#index'
  end
  root to: "home#index"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :users, only: :index

  resources :documents, only: [:create, :destroy, :edit, :update] do
    post 'sort' => 'documents#sort', on: :collection
  end

  match '/about', to: 'home#about'
  match '/help', to: 'home#help'
  match '/contact', to: 'home#contact'
  match '/demo', to: 'home#demo'
end

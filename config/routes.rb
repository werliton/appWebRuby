Rails.application.routes.draw do
  LOCALES = /en|pt\-BR/
  scope "(:locale)", :locale => LOCALES do
    resources :rooms
    resources :users

    resource :confirmation, :only => [:show]

    resource :user_sessions, :only => [:create, :new, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  match '/:locale' => 'home#index', :locale => LOCALES, :via => [:get, :post]
  root :to => "home#index"
end

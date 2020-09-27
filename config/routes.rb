Rails.application.routes.draw do
    resources :user

    root 'welcome#index'

    resources :product, :except => [:index]
end

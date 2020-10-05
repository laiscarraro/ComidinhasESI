Rails.application.routes.draw do
    resources :user
    root 'home#index'
    get 'home/index'
    get 'home/search' => 'home#search'
    get 'home/category' => 'home#category'
    get '/login/index' => 'login#index'
    resources :product, :except => [:index]
end

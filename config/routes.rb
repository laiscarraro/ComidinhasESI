Rails.application.routes.draw do
    get '/user/payment_method' => 'user#payment_method'
    match "/user/payment_method", to: "user#payment_method", via: [:put], as: :payment_method
    resources :user
    get '/logout' => 'login#logout'
    root 'home#index'
    get 'home/index'
    get 'home/search' => 'home#search'   
    get 'home/category' => 'home#category'
    get '/login/index' => 'login#index'
    get '/login/user_exists' => 'login#user_exists'
    post '/login/authenticate' => 'login#authenticate'
    get '/suggestions' => 'suggestions#index'
    post '/suggestions/create' => 'suggestions#create'
    resources :suggestions
    resources :product, :except => [:index]
end

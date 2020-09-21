Rails.application.routes.draw do
    root 'home#index'
    get 'home/index'
    get 'home/:name' => 'home#show'
    resources :product, :except => [:index]
end
Rails.application.routes.draw do
    resources :user
    root 'home#index'
    get 'home/index'
    get 'home/search' => 'home#search'
    resources :home    
    resources :product, :except => [:index]
end

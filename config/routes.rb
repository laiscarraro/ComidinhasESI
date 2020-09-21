Rails.application.routes.draw do
    root 'home#index'
    resources :product, :except => [:index]

end
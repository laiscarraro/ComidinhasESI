Rails.application.routes.draw do
    root 'welcome#index'

    resources :product, :except => [:index]

end

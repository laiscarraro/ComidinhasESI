Rails.application.routes.draw do
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
    post '/suggestions_vote/create' => 'suggestion_vote#create'
    delete '/suggestions_vote/destroy' => 'suggestion_vote#destroy'
    resources :suggestions
    resources :product, :except => [:index] do
        resources :ratings
    end
end

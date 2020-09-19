Rails.application.routes.draw do
    resources :usuarios
    root 'usuarios#new'
end

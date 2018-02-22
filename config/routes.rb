Rails.application.routes.draw do
  # get 'doses/new'

  # get 'doses/create'

  # get 'doses/destroy'

  # get 'cocktails/index'

  # get 'cocktails/show'

  # get 'cocktails/new'

  # get 'cocktails/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get "doses/:id", to: "doses#show", as: :dose
  delete "doses/:id", to: "doses#destroy"

  resources :cocktails, only: [ :index, :show, :new, :create] do
    resources :doses, only: [ :new, :create ]
  end
end

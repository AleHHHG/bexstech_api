Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :questions, only: %i[index show create]
  resources :answers, only: %i[index create] do
    member do
      put 'like'
    end
  end
end

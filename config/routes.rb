Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'homes#top'
  get 'about' => 'homes#about'

  resources :decks do
    resources :cards
  end
end

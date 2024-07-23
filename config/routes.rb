Rails.application.routes.draw do
  root "decks#index"
  
  # resources :decks
  # resources :cards
  resources :decks do
    resources :cards
  end
end

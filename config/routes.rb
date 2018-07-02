Rails.application.routes.draw do
  root 'games#index'

  resources :games, only: [:create]
  resources :players, only: [] do
    collection do
      get :top_ten
    end
  end

  resources :rounds, only: [] do
    resources :items, only: [] do
      collection do
        resources :targeted, only: %i[index create],
                             controller: 'rounds/items/targeted'
      end
    end
  end
end

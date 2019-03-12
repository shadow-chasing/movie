Rails.application.routes.draw do

  namespace :admin do
    # admin dashboard
    get '', to: 'dashboard#index', as: '/'
      # resources
			resources :articles
      # devise
      devise_for :users, controllers: { sessions: 'admin/users/sessions', registrations: 'admin/users/registrations'}
  end

  scope module: 'movie_data', path: 'movie_data' do

    # root
    root "movies#index"
    get 'genre/:gen', to: 'genres#index', as: :genre

    # scoped resources movie_data
    resources :movies
    resources :actors, only: [:index, :show]
    resources :directors, only: [:index, :show]
    resources :genres, only: [:index]

  end

  # articles index and show user resources
  resources :articles, only: [:index, :show]

end

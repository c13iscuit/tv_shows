TvShows::Application.routes.draw do
  resources :television_shows, only: [:index, :show, :new, :create]
  resources :characters

  resources :television_shows do
    resources :characters
  end
end

Rails.application.routes.draw do
  root 'billboards#index'

  resources :artists do
    resources :songs, only: [:edit, :new, :create, :destroy, :update]
  end

  patch '/billboard/:id/song/:song_id', to: 'billboardss#add_song_to_billboard', as: "song_to_billboard"
	delete 'remove_billboard_song/:id/:song_id', to: 'billboards#remove_song_from_billboard', as: 'remove_song_from_billboard'
  
  resources :billboards

end

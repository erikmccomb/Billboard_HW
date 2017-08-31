class SongsController < ApplicationController
  def edit
  end

  def new
    @song = Song.new
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def update
    if @song.update(song_params)
      redirect_to artist_path(@song.artist)
    else
      render :edit
    end
  end

  def destroy
    artist = @song.artist
    @song.destroy
    redirect_to artist_path(artist)
  end

  private
    def set_artist 
      @artist = Artist.find(params[:artist_id])
    end

    def set_song 
      @song = Song.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:title, :artist, :chart)
    end 

end
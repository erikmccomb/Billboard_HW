class BillboardsController < ApplicationController
  before_action :set_billboard, only: [:show, :update, :edit, :destroy, :add_song_to_billboard, :remove_song_from_billboard]
  before_action :set_song, only: [:add_song_to_billboard, :remove_song_from_billboard]
  
  def index
    @billboards = Billboard.all
  end

  def show
  end

  def new
    @billboard = Billboard.new
    render partial: "form"
  end

  def edit
    render partial: "form"
  end

  def create
    @billboard = Billboard.new(billboard_params)
    if @billboard.save
      redirect_to billboards_path
    else
      render :new
    end
  end

  def update
    if @billboard.update(billboard_params)
      redirect_to @billboard
    else
      render :edit
    end
  end

  def destroy
    @billboard.destroy
    redirect_to billboards_path
  end

  def add_song_to_billboard
    @billboard.songs << @song
    redirect_to billboard_path(@billboard)
  end

  def remove_song_from_billboard
    Song.find(params[:song_id]).update(billboard_id: nil)
    redirect_to billboard_path(@billboard)
  end

  private
    def set_billboard
      @billboard = Billboard.find(params[:id])
    end

    def billboard_params
      params.require(:billboard).permit(:name)
    end
end

class AlbumsController < ApplicationController
  before_action :redirect_if_not_logged_in 

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new
    @band = Band.find(params[:band_id])
    @bands = Band.all
    render :new
  end

  def edit
    @album = Album.find(params[:id])
    @band = @album.band
    @bands = Band.all
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      render :edit
    end

  end

  def create
    @album = Album.new(album_params)
    @band = @album.band
    if @album.save
      redirect_to album_url(@album)
    else
      render :new
    end
  end

  private

    def album_params
      params.require(:album).permit(:name, :recording, :band_id)
    end

end

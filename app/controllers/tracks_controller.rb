class TracksController < ApplicationController
  before_action :redirect_if_not_logged_in
  
  def create
    @track = Track.new(track_params)
    @album = @track.album
    if @track.save
      redirect_to track_url(@track)
    else
      render :new
    end
  end

  def new
    @albums = Album.all
    @album = Album.find(params[:album_id])
    @track = Track.new
    render :new
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def edit
    @track = Track.find(params[:id])
    @album = @track.album
    @albums = Album.all
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      render :edit
    end

  end

  private

    def track_params
      params.require(:track).permit(:name, :album_id, :lyrics, :listing)
    end
end

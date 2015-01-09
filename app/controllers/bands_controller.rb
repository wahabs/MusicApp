class BandsController < ApplicationController
  before_action :redirect_if_not_logged_in
  
  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      render :new
    end
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def destroy

  end

  private

    def band_params
      params.require(:band).permit(:name)
    end
end

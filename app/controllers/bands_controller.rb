class BandsController < ApplicationController
  before_action :login_permission

  def new
    @band = Band.new
    render :new
  end

  def create
    band = Band.new(band_params)
    band.save
    redirect_to band_url(band)
  end

  def show
    @band = Band.find_by_id(params[:id])
    @albums = @band.albums.order(:title)
    render :show
  end

  def index
    @bands = Band.all
    @bands.order(:name)
    render :index
  end

  def update
    @band = Band.find_by_id(params[:id])
    render :update
  end

  def destroy
    @band = Band.find_by_id(params[:id])
    @band.destroy!
    redirect_to bands_url
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end

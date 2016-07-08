class AlbumsController < ApplicationController
  before_action :login_permission

  def new
    @album = Album.new
    @bands = Band.all
    render :new
  end

  def create
    album = Album.new(album_params)
    album.save
    redirect_to album_url(album)
  end

  def show
    @album = Album.find_by_id(params[:id])
    @bands = Band.all
    render :show
  end

  def update
    @album = Album.find_by_id(params[:id])
    @bands = Band.all
    render :update
  end

  def index
    @albums = Album.all
    render :index
  end

  def destroy
    album = Album.find_by_id(params[:id])
    album.destroy!
    redirect_to bands_url
  end
  private

  def album_params
    params.require(:album).permit(:title, :band_id, :los)
  end

  def logged_in?

  end
end

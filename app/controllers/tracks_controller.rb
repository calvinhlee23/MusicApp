class TracksController < ApplicationController
  before_action :login_permission

  def new
    @track = Track.new
    @albums = Album.all
    render :new
  end

  def create
    track = Track.new(track_params)
    track.save
    redirect_to track_url(track)
  end

  def update
    @track = Track.find_by_id(params[:id])
    @albums = Album.all
    render :update
  end

  def show
    @track = Track.find_by_id(params[:id])
    @albums = Album.all
    render :show
  end

  def destroy
    track = Track.find_by_id(params[:id])
    track.destroy!
    redirect_to bands_url
  end

  private
  def track_param
    params.require(:track).permit(:title, :album_id, :bor, :lyrics )
  end
end

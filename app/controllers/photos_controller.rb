class PhotosController < ApplicationController
  before_action :authenticate_user!

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to root_path
    else render :new
    end
  end

  private
  def photo_params
    params.require(:photo).permit(:cat_photo, :detail, cat_ids: [])
  end
end

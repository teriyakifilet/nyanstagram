class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:show]

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

  def show
    @photo = Photo.includes(:cats, :user).find(params[:id])
  end

  def edit
  end

  def update
  end
  
  private

  def photo_params
    params.require(:photo).permit(:cat_photo, :detail, cat_ids: []).merge(user_id: current_user.id)
  end
end

class PhotosController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_photo, only: %i[show edit update destroy]
  before_action :user_id_verification, only: %i[edit update destroy]

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

  def show; end

  def edit; end

  def update
    if @photo.update(photo_params)
      redirect_to photo_path
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to root_path
  end

  private

  def photo_params
    params.require(:photo).permit(:cat_photo, :detail, cat_ids: []).merge(user_id: current_user.id)
  end

  def set_photo
    @photo = Photo.includes(:cats, :user).find(params[:id])
  end

  def user_id_verification
    redirect_to root_path unless current_user.id == @photo.user_id
  end
end

class LikesController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :set_photo, except: [:index]
  before_action :set_like, except: [:index]

  def index
    @user = User.includes(:likes).find(params[:user_id])
  end

  def create
    like = Like.create(user_id: current_user.id, photo_id: @photo.id)
  end

  def destroy
    like = Like.find_by(user_id: current_user, photo_id: @photo.id)
    like.delete
  end

  private

  def set_photo
    @photo = Photo.find(params[:photo_id])
  end

  def set_like
    photo = Photo.find(params[:photo_id])
  end
end

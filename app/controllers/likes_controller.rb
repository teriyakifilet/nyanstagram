class LikesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_photo
  before_action :set_like

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

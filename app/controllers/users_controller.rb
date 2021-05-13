# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user

  def show
    @cats = @user.cats
    @photos = @user.photos
  end

  def destroy
    redirect_to root_path if @user.destroy
  end

  private
  def set_user
    @user = User.includes(:cats, :photos).find(params[:id])
  end
end

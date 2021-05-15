# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!, except: [:show]
  before_action :user_id_verification, except: [:show]
  before_action :user_params, only: [:update]

  def show
    @cats = @user.cats
    @photos = @user.photos
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @user.destroy
  end

  private

  def set_user
    @user = User.includes(:cats, :photos).find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :user_profile)
  end

  def user_id_verification
    redirect_to root_path unless current_user.id == @user.id
  end
end

# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.includes(:cats, :photos).find(params[:id])
    @cats = @user.cats
    @photos = @user.photos
  end
end

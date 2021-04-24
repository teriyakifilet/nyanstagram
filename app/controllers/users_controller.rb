# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.includes(:cats).find(params[:id])
    @cats = @user.cats
  end
end

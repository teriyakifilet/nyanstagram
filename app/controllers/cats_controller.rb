# frozen_string_literal: true

class CatsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @photos = Photo.includes(:cats).order('created_at DESC').limit(5)
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to root_path
    else render :new
    end
  end

  def show
    @cat = Cat.includes(:user, :photos).find(params[:id])
    @photos = @cat.photos
  end

  def edit
    @cat = Cat.includes(:user).find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      redirect_to cat_path
    else render :edit
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:cat_name, :cat_age, :cat_sex_id, :cat_breed_id, :icon).merge(user_id: current_user.id)
  end
end

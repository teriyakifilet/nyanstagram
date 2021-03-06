# frozen_string_literal: true

class CatsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_cat, only: %i[show edit update destroy]
  before_action :user_id_verification, only: %i[edit update destroy]

  def index
    @photos = Photo.includes(:cats).order('created_at DESC').limit(24)
    @cats = Cat.order('created_at DESC').limit(12)
    if user_signed_in? && current_user.following.present?
      @user = User.includes(:following).find(current_user.id)
      @following_cats = @user.following.includes(:photos)
      @following_cats_photos = Photo.joins(:cat_photos).where("cat_photos.cat_id":  @following_cats.map(&:id)).order('created_at DESC').limit(6)
    end
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_path(@cat)
    else render :new
    end
  end

  def show
    @photos = @cat.photos.order('created_at DESC').page(params[:page]).per(9)
  end

  def edit; end

  def update
    if @cat.update(cat_params)
      redirect_to cat_path
    else render :edit
    end
  end

  def destroy
    @user = @cat.user
    @cat.destroy
    redirect_to user_path(@user)
  end

  private

  def cat_params
    params.require(:cat).permit(:cat_name, :cat_age, :cat_sex_id, :cat_breed_id, :icon).merge(user_id: current_user.id)
  end

  def set_cat
    @cat = Cat.includes(:user, :photos).find(params[:id])
  end

  def user_id_verification
    redirect_to root_path unless current_user.id == @cat.user_id
  end
end

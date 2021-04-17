# frozen_string_literal: true

class CatsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index; end

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

  private

  def cat_params
    params.require(:cat).permit(:cat_name, :cat_age, :cat_sex_id, :cat_breed_id, :icon).merge(user_id: current_user.id)
  end
end

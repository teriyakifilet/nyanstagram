class RelationshipsController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :set_cat, except: [:index]
  before_action :set_follow, except: [:index]

  def index
    @user = User.includes(:following).find(params[:user_id])
  end

  def create
    follow = Relationship.create(user_id: current_user.id, cat_id: @cat.id)
  end

  def destroy
    follow = Relationship.find_by(user_id: current_user, cat_id: @cat.id)
    follow.delete
  end

  private

  def set_cat
    @cat = Cat.find(params[:cat_id])
  end

  def set_follow
    cat = Cat.find(params[:cat_id])
  end
end
class RelationshipsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_cat
  before_action :set_follow

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

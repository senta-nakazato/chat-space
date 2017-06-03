class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
  end

  def edit
  end

  def update
  end

  private
  def group_params
    params.include(:group).permit(:name, user_ids: [])
  end
end

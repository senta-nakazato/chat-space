class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = "グループを作成しました！"
      redirect_to group_messages_path(@group)
    else
      flash[:alert] = "このグループはすでに存在します"
      redirect_to new_group_path
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:notice] = "グループを編集しました！"
      redirect_to group_messages_path(@group)
    else
      flash[:alert] = "すでに存在するグループです"
      redirect_to  edit_group_path(@group)
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, {user_ids: []})
  end
end


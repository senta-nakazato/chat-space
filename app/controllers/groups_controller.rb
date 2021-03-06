class GroupsController < ApplicationController
  before_action :set_group, only: [:edit,:update]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_messages_path(@group), notice: "グループを作成しました"
    else
      flash.now[:alert] = "このグループはすでに存在します"
      render :new
    end
  end

  def edit
  end

  def update
    binding.pry
    if @group.update(group_params)
      redirect_to group_messages_path(@group), notice: "グループを編集しました"
    else
      flash.now[:alert] = "すでに存在するグループです"
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end


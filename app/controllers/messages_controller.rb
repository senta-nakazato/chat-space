class MessagesController < ApplicationController
  before_action :get_group

  def index
    @groups = current_user.groups
    @messages = Message.where(group_id: @group.id)
  end

  private
  def get_group
    @group = Group.find(params[:group_id])
  end
end


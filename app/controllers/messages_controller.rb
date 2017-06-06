class MessagesController < ApplicationController
  before_action :get_group

  def index
    @groups = current_user.groups
    @users = @group.users
    @message = Message.new
    @messages = Message.where(group_id: @group.id)
  end

  def create
    Message.create(message_params)
    redirect_to :index
  end

  private
  def get_group
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.permit(:text).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end


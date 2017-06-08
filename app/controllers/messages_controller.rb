class MessagesController < ApplicationController
  before_action :get_group

  def index
    @groups = current_user.groups
    @users = @group.users
    @message = Message.new
    @messages = Message.where(group_id: @group.id)
  end

  def create

    @message = Message.new(message_params)
    if @message.save

      redirect_to  group_messages_path(@group)
    else
      flash[:alert] = "メッセーシを入力してください"
      redirect_to group_messages_path(@group)
    end
  end

  private
  def get_group
    @group = Group.find(params[:group_id])
  end

  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end


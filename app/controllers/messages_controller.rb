class MessagesController < ApplicationController
  before_action :get_group

  def index
    @message = Message.new
    get_current_user_groups
    get_messages
    get_users
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(@group), notice: "投稿しました" }
        format.json
      end
    else
      flash.now[:alert] = "メッセーシを入力してください"
      get_users
      get_messages
      get_current_user_groups
      render :index
    end
  end

  private
  def get_group
    @group = Group.find(params[:group_id])
  end

  def get_current_user_groups
    @groups = current_user.groups
  end

  def get_users
    @users = @group.users
  end

  def get_messages
    @messages = @group.messages.includes(:user)
  end

  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end


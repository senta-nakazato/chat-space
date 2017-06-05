class MessagesController < ApplicationController
  before_action :get_group

  def index
    @groups = current_user.groups
  end

  def get_group
    @group = Group.find(params[:group_id])
  end
end


class MessagesController < ApplicationController
  def index
    @user = User.new
  end
end


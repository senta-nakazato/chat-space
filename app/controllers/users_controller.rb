class UsersController < ApplicationController
  def edit
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = "ユーザー内容を編集しました！"
      redirect_to root_path
    else
      flash.now[:alert] = "編集できません"
      render :edit
    end
  end

  def search
    @users = User.search_users(params[:keyword], current_user)
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end


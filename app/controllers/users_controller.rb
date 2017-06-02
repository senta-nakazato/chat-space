class UsersController < ApplicationController
  def edit
  end

  def update
    User.update(user_params)
    redirect_to action: :edit
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end


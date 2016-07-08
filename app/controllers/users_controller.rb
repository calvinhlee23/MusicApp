class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    user = User.new(users_params)
    if user.save!
      login!(user)
      redirect_to bands_url
    else
      flash.now json: user.errors.full_messages
      redirect_to new_user_url
    end

  end


  private
  def users_params
    params.require(:user).permit(:email, :password)
  end
end

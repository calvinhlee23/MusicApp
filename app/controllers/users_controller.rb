class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.new(users_params)
    user.save!
  end


  private
  def users_params
    params.require(:users).permit(:email, :password)
  end
end

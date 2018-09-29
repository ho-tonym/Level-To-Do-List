class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    if User.find_by(:name => params[:user][:name]) || @user.valid?
      session[:user_id] = @user.id
      redirect_to "/"
    else
      redirect_to "/users/signup"
    end
  end

  def show
    if !@user
      redirect_to "/users/login"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end

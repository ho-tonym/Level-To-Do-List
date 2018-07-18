class UsersController < ApplicationController

  def new
    # if logged_in?
    #   redirect "/users/#{@user.id}/lists"
    # end
  end

  def create

    if User.find_by(:name => params[:user][:name])
      redirect_to "/users/signup"
    elsif params[:user][:name] != "" || params[:user][:password] != ""
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to lists_path
    else
      redirect_to "/users/signup"
      # redirect_to new_user_path
    end
    # no route item because ite wasnt saved correctly
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

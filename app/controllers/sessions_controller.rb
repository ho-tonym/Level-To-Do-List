class SessionsController < ApplicationController

  def new
    # raise params.inspect
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])

      session[:user_id] = @user.id
      # redirect_to user_path(@user)
      redirect_to "/users/#{@user.id}/lists"
    else
      # render :new
      # redirect_to "/users/login"
      redirect_to "/users/signup"
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end

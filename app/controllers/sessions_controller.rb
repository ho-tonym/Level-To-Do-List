require 'pry'
class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_to lists_path
    end
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      # redirect_to user_path(@user)
      redirect_to lists_path
    else
      # render :new
      redirect_to "/users/login"
    end
  end


  def destroy
    session.clear
    redirect_to '/'
  end
end

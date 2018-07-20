class SessionsController < ApplicationController

  def new
    # raise params.inspect
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      oauth_email = auth_hash["info"]["email"]
      oatuh_nickname = auth_hash["info"]["nickname"]
      if @user = User.find_by(:email => oauth_email)
        session[:user_id] = @user.id
        redirect_to "/users/#{@user.id}/lists"
      else
        @user = User.new(:email => oauth_email, :password => SecureRandom.hex)
        if @user.save
          session[:user_id] = @user.id
          redirect_to "/users/#{@user.id}/lists"
        else

        end
      end
    end


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

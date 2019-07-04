class ListsController < ApplicationController
  before_action  :require_logged_in

  def time
    raise params.inspect
  end

  def index
    if @user = User.find_by(id: session[:user_id])
      @list = List.new # item for form to wrap around
      @lists = @user.lists
    else
      redirect_to "/users/login"
    end
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @list = List.find(params[:id])
    @item = Item.new #item tag is empty: set up for form_for tag to wrap around
    @tag = Tag.new
    @tags = @list.tags
    respond_to do |f|
      f.html { render :show }
      f.json { render json: @list}
    end
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @list = @user.lists.create(list_params)
    if @list.save
      redirect_to "/users/#{@user.id}/lists/#{@list.id}"
    else
      @lists = @user.lists
      render :index
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    render json: @list
  end

  private
    def list_params
      params.require(:list).permit(:name)
    end
end

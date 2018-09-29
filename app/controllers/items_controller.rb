class ItemsController < ApplicationController
  # before_action  :require_logged_in
  def index
    redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)
    if @item.save
      # render 'items/show', :layout => false
      respond_to do |f|
        f.json{render :json => @item}
        f.html{redirect_to user_list_path(@item.list.user,@item.list)}
      end
    else
      #instead of rendering it again, throw an error
      render user_list_path(@list.user, @list)
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to user_list_path(@item.list.user, @item.list)
  end

  def destroy
    @item = Item.find(params[:id])
    newlevel = @item.list.user.level += 1
    @item.list.user.update_attribute(:level, newlevel)
    @item.destroy
    render json: @item
    # respond_to do |f|
    #   f.json{render :json => @item}
    #   f.html{redirect_to user_list_path(@item.list.user ,@item.list)}
    # end
  end

  private
    def item_params
      params.require(:item).permit(:description, :status)
    end

end

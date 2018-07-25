class ItemsController < ApplicationController
  # before_action  :require_logged_in
  def index
    redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"
  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)
    if @item.save
      # render somethings that just has the LI I want
      # why not just create a comments/show view that shows the LI of one comment
      render 'items/show', :layout => false
      # render user_list_path(@list.user, @list)
    else
      render user_list_path(@list.user, @list)
    end
  end

  # for changing status of complete/na
  # PATCH - /lists/:list_id/items/:id
  def update

    @item = Item.find(params[:id])
    @item.update(item_params)

    redirect_to user_list_path(@item.list.user, @item.list)
  end

  def destroy
    @item = Item.find(params[:id])
    newlevel = @item.list.user.level +=1

    @item.list.user.update_attribute(:level, newlevel)
    @item.destroy

    redirect_to user_list_path(@item.list.user ,@item.list)
  end

  private
    def item_params
      params.require(:item).permit(:description, :status)
    end

end

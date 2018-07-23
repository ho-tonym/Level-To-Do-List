class ItemsController < ApplicationController
  # before_action  :require_logged_in
  def index
    redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"
  end

  def create
    @list = List.find_by(id: params[:list_id])
    @item = @list.items.build(item_params)

    if @item.save
      redirect_to user_list_items_path(@list.user, @list, @item)
    else
      redirect_to user_list_path(@list.user, @list)
    end
  end

  # for changing status of complete/na
  # PATCH - /lists/:list_id/items/:id
  def update

    @item = Item.find_by(id: params[:id])
    @item.update(item_params)

    redirect_to user_list_path(@item.list.user, @item.list)
  end

  def destroy
    @item = Item.find_by(id: params[:id])
    newlevel = @item.list.user.level +=1

    @item.list.user.update_attribute(:level, newlevel)
    @item.destroy

    redirect_to user_list_path(@item.list.user ,@item.list)
  end

  private
    def item_params
      params.require(:item).permit(:description)
    end
end

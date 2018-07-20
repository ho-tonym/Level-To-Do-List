class ItemsController < ApplicationController
  # before_action  :require_logged_in
  def index

    redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"

  end

  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)
    if @item.save
      redirect_to user_list_items_path(@list.user, @list, @item)
    else
      render "lists/show"
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
    @item.destroy

    redirect_to user_list_path(@item.list.user ,@item.list)
  end

  private
    def item_params
      params.require(:item).permit(:description, :status)
    end

end

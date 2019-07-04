class TagsController < ApplicationController

  def index
    redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"
  end

  def create
    @list = List.find(params[:list_id], params[:user_id])# has user_id
    @tag = Tag.new(tag_params)
    if @tag.save
      @list_tag = ListTag.create(tag_id: @tag.id, list_id: params[:list_id])
      redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"
    else
        redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"
    end
  end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end
end

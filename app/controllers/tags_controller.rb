class TagsController < ApplicationController
  # before_action  :require_logged_in
  def index
    redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"
  end

  def create

    @list = List.find(params[:list_id], params[:user_id])# has user_id
    @tag = Tag.new(tag_params)
    # @tag = @list.tags.build(tag_params)
    if @tag.save
      @list_tag = ListTag.create(tag_id: @tag.id, list_id: params[:list_id])
      # @list_tag.save
      redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"
    else
        redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"
      # render "lists/show"
    end
  end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end

end

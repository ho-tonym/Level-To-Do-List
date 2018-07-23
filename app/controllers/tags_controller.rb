class TagsController < ApplicationController
  # before_action  :require_logged_in
  def index
    redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"
  end

  def create
    @list = List.find_by(id: params[:list_id])# has user_id
    @tag = Tag.new(tag_params)

    if @tag.save #tag doesnt exist
      list_tag = ListTag.create(tag_id: @tag.id, list_id: @list.id, date: params[:tag][:date])
      redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"
    else
      @tag = Tag.find_by(name: @tag.name)
      #if tag exists, the there wont be a date shown
      #tag exists AND there is a join, wont make a new tag
      if @tag && ListTag.find_by(tag_id: @tag.id, list_id: @list.id)
        redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"
      else # tag exists, make a new join
        list_tag = ListTag.create(tag_id: @tag.id, list_id: @list.id, date: params[:tag][:date])
        redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"
      end
    end
  end

  private
    def tag_params
      params.require(:tag).permit(:name, :date)
    end
end

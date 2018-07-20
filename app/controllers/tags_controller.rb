class TagsController < ApplicationController
  # before_action  :require_logged_in
  def index
    redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"
  end

  def create
    # binding.pry
    @list = List.find(params[:list_id], params[:user_id])# has user_id
    @tag = Tag.new(tag_params)
    if @tag.save # can be saved(new)
      @list_tag = ListTag.create(tag_id: @tag.id, list_id: params[:list_id])
      redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"
    elsif !!(Tag.find_by(tag_params))#(cant be saved, but it exists)
      @found_tag = Tag.find_by(tag_params)
      @list_tag = ListTag.find_or_create_by(tag_id: @found_tag.id, list_id: params[:list_id])
      redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"
    else
      redirect_to "/users/#{params[:user_id]}/lists/#{params[:list_id]}"
    end
  end

  # item - id, list_id
  # list- id, user_id
  # for updating status of an item in a list

  # def show
  #   # we have a tag
  #     if params[:name].present? # check if its empy (/validation)
  #       tag = Tag.find_or_create_by(name: params[:name]) # find or create
  #       tag.new_record?
  #       # if !self.categories.include?(category)
  #       #   self.post_categories.build(:category => category)
  #       # end
  #     end
  #   end
  # end
  #
  # def destroy
  #   binding.pry
  #   @item = Item.find(params[:id])
  #   @item.destroy
  #   redirect_to user_list_path(@item.list)
  # end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end

end

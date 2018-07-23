class ListsController < ApplicationController
  # skip_before_action :require_login, only: [:index]
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

    @list = List.find(params[:id])
    @item = Item.new #item, tag are empty but set up for form_for tag to wrap around
    @tag = Tag.new
    # @user = User.find(1)
    # @list.tags
    @tags = @list.tags
    # @list_tags = ListTag.where(list_id: @list.id)
    # @tags = Tag.where(id: @list_tags.tag_id)
    # @list_tags
    # # binding.pry
    # 10 - tag id
  end

  def create

    @user = User.find_by(id: session[:user_id])
    @list = @user.lists.create(list_params)
    # creates a list associated with user
    #each list++, so no overlap with other users-
    # find by list and you will get the user, other people cant see a list that isnt theirs
    if @list.save
      redirect_to "/users/#{@user.id}/lists/#{@list.id}"
      # redirect_to user_list_url(@list)
    else
      @lists = @user.lists
      render :index
    end
    # binding.pry
  end

  private
    def list_params
      params.require(:list).permit(:name)
    end
end






# app/views/user/new.html.erb
# <%= form_for :user, url: '/users' do |f| %>
#   Username: <%= f.text_field :username %>
#   Password: <%= f.password_field :password %>
#   Password Confirmation: <%= f.password_field :password_confirmation %>
#   <%= f.submit "Submit" %>
# <% end %>

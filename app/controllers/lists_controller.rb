class ListsController < ApplicationController
  # before_action :require_login
  before_action  :require_logged_in
  # skip_before_action :require_login, only: [:index]

  def index
    @list = List.new
    @lists = List.all
    # render 'lists/index.html.erb'
  end

  def show
    @list = List.find(params[:id])
    @item = Item.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_url(@list)
    else
      @lists = List.all
      render :index
    end
  end
  private

    def list_params # strong parameters
      params.require(:list).permit(:name)
    end

    # def require_login
    #   return head(:forbidden) unless session.include? :user_id
    # end
end






# app/views/user/new.html.erb
# <%= form_for :user, url: '/users' do |f| %>
#   Username: <%= f.text_field :username %>
#   Password: <%= f.password_field :password %>
#   Password Confirmation: <%= f.password_field :password_confirmation %>
#   <%= f.submit "Submit" %>
# <% end %>

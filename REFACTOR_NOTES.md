1. Scope Method

  New route is nested in users:
    get :items, on: :member
    "/users/:user_id/items"

  There is a class method called my_users_items that takes the user_id as a parameter.
  When we load lists#index, there is a button at the bottom that links to this new route called "All My Items".

  When clicked, we the UserController catches the request at the items action.

    def items
      user = User.find_by(:id =>params[:id])
      @user_items = List.my_users_items(user.id)
    end

  Here we find the user, get all the user's items through the list association.
  Implicitly, we render /views/users/items.html.erb where we display them.



2. User Submittable on Join Table

  I added an optional textfield next to where we create tags for an integer date.  
  <%= f.text_field :date, :placeholder => "date (optional)" %>

  When submitted, we end up in tag#create where we make a new tag. Since a new tag is created, our date setter and getter defined in the model will be initiated. Theres a bunch of logic for if a tag exists, if there is a join table ListTag for this relationship.
  Note: if tag exists, the there wont be a date shown

  Finally we redirect back to the list#show page:

  <%@tags.each do |t| %>
    <label for="tag_id_<%=t.id%>" >◙ <%= t.name %> </label>
      <%lt = ListTag.find(t.id)%>
      <% if lt.date %>
          date: <%= lt.date %>
      <%end %>
  <%end%>

  @tags is all the tags associated with that list.
  We will display the date if there is a date in ListTag for each tag associated with our list.

  I know we shouldn't directly query our model from the view, but I can't think of an alternative right now.

  Please let me know if everything looks fine!
  Pointers for refactoring to have cleaner code is always welcome!

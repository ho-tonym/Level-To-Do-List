
<li class="<%"completed" if item.complete?%>">
  <div class="item-text">
    <div class="row">
    <!-- checkbox, submit -->
    <%= form_for [@list, item], :url => user_list_item_path(@list.user, @list, item) do |f| %>
      <%= f.check_box :status, :class => "col-offset-2", :checked => item.done? %>
       <%= f.submit %>
    <% end %>
<!-- description -->
  <label class="col"><%= item.description %></label>
      <!-- "/users/1/lists/1/items/2" -->
    <%= form_tag(user_list_item_path(item.list.user,item.list, item), :method => :delete) do %>
      <button type="submit" class="col-destroy">X</button>
    <%end%>
  </div>
  </div>
</li>

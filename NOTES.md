<div>
  <h4>Add a new comment:</h4>
  <%= form_for (@post) do |f| %>
    <%= f.collection_select :user, User.all, :id, :username %>
    <%= f.fields_for :users do |user| %>
      <%= user.username %>
      <%= user.email %>
    <% end %>
    <%= f.fields_for :comments do |comment| %>
      <%= comment.label :content %>
      <%= comment.text_area :content %>
    <% end %>
  <% end %>
</div> 


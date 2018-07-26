$(function(){
  $("form#new_item").submit(function(event) {
    event.preventDefault();
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      success: function(response){

        $('.enter_new_item').val("")
        let $div = $("div.all-items-inlist")
        $div.append(response);
    }})

  });
});
//when you first arrive on the list show page, when you create a new item on that list, it will show the html
$(function(){
  $("div.all-items-inlist").on("submit", "form.destroy_button", function(event) {
    event.preventDefault();
      $.ajax({
        type: "DELETE",
        url: this.action,
        data: $(this).serialize(),

        success: function(json){
          $("div#item-text"+json.id).remove();
        }
    })
  })
});

$(function(){
  $("div.all-lists-inlist").on("submit", "form.destroy_button", function(event) {
    event.preventDefault();
    $.ajax({
      type: "DELETE",
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        console.log("response")
        $("div#list-text"+response.id).remove();
      }
    })
  })
});
// remove list item

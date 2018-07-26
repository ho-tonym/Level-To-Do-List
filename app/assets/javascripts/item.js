$(function(){
  //forms of that have id of new item
  $("form#new_item").submit(function(event) {
    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),

      success: function(response){
        $('.enter_new_item').val("")
        let $div = $("div.all-items-inlist")
        $div.append(response);
    }})
    event.preventDefault();
  });
});

// Item.destroy = function(json){
//   var item = new Item(json);
//   item.destroy()
// }
// destroy_button
$(function(){
  $("form.destroy_button").submit(function(event) {
    event.preventDefault();
    $.ajax({
      type: "DELETE",
      url: this.action,
      data: $(this).serialize(),

      success: function(json){
      $("div#item-text"+json.id).remove();
    }})
  });
})
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
// $('.col-destroy').on('click', function () {
//   event.preventDefault();
//     alert( "Handler for .click() called." );
// });
// function(){
//   $( "button.col-destroy" ).on("click", "input.destroy",function() {
//     event.preventDefault();
//     alert( "Handler for .click() called." );
//   });
//
// }

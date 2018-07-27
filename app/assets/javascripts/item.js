// function Item(attributes){
//   this.description = attributes.name;
//   this.id = attributes.id;
// }
//
// $(function(){
//   Item.source = $("#item-template").html()
//   Item.template= Handlebars.compile(Item.source);
// })
//
// Item.prototype.renderLI = function() {
//   return Item.template(this)
//   //this is the item itself which has those values- which knows how to prefill the item with its properties
// }

// $(function(){
//   $("form#new_item").submit(function(event) {
//     event.preventDefault();
//     $.ajax({
//       type: "POST",
//       url: this.action,
//       data: $(this).serialize(),
//
//       success: function(json){
//         $('.enter_new_item').val("")
//         let $div = $("div.all-items-inlist")
//         $div.append(json);
//     }})
//   });
// });

$(function(){
  $("form#new_item").submit(function(event) {
    event.preventDefault();

    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      dataType: "json",

      success: function(json){
        // let item = new Item(json);
        // let itemLI = item.renderLI()
        $('.enter_new_item').val("")

        source = $("#item-template").html()
        template= Handlebars.compile(source);
        result = template(json);
        $("div.all-items-inlist").append(result);
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
        success: function(response){
          $("div#item-text"+response.id).remove();
        }
    })
  })
});

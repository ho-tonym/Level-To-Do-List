class Item{
  //init
  constructor(attributes){
    this.description = attributes.description;
    this.id = attributes.id;
  }
  //like prototypes, instance methods
  //static method - like class methods
  static template(){
    $('.enter_new_item').val("")
    Item.source = $("#item-template").html()
    Item.template= Handlebars.compile(Item.source);
  }
}

$(function(){
  $("form#new_item").submit(function(event) {
    event.preventDefault();

    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),
      dataType: "json",

      success: function(json){
        // debugger
      // description: json.description, id: json.id
      let item = new Item(json);
      let result = Item.template(item);
      debugger
      $("div.all-items-inlist").append(result);
    }})
  });
});
/////////////no handlebars//////////////
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
////////////using handlebars/////////////
// $(function(){
//   $("form#new_item").submit(function(event) {
//     event.preventDefault();
//
//     $.ajax({
//       type: "POST",
//       url: this.action,
//       data: $(this).serialize(),
//       dataType: "json",
//
//       success: function(json){
//       // let item = new Item(json);
//       // let itemLI = item.renderLI()
      // $('.enter_new_item').val("")
      //
      // source = $("#item-template").html()
      // template= Handlebars.compile(source);
      // result = template(json);
      // $("div.all-items-inlist").append(result);
//     }})
//   });
// });

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

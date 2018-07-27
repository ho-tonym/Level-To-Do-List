class Item{
  //init
  constructor(attributes){
    this.description = attributes.description;
    this.id = attributes.id;
  }

  static itemCreate(item){
    let templateFunction = Item.template(item);
    let result = templateFunction(item)
    $("div.all-items-inlist").append(result);
  }

  static template(){
    $('.enter_new_item').val("")
    let source = $("#item-template").html()
    return Handlebars.compile(source);
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
        item = new Item(json);
        Item.itemCreate(item);
    }})
  });
});

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

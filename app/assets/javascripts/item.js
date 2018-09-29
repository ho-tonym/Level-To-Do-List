class Item{
  //init
  constructor(attributes){
    this.description = attributes.description;
    this.id = attributes.id;
  }
  static appendToTop(result){
    $("div.all-things-inlist").append(result);
  }
  static appendToBottom(result){
    $("#all_new_items_1").append(result);
  }
  static template(item){
    $('.enter_new_item').val("")
    let source = $("#item-template").html()
    let templateFunction = Handlebars.compile(source);
    return templateFunction(item)
  }
  static compareByDescription(a, b) {
    const descriptionA = a.description.toUpperCase();
    const descriptionB = b.description.toUpperCase();

    let comparison = 0;
    if (descriptionA > descriptionB) {
      comparison = 1;
    } else if (descriptionA < descriptionB) {
      comparison = -1;
    }
    return comparison;
  }
  static getItems(items_array){
    items_array.forEach(function(element){
      let item = new Item(element);
      let result = Item.template(item);
      Item.appendToBottom(result)
    })
  }
}

$(function(){
  $("form#new_item").submit(function(event) {
    event.preventDefault();

    $.ajax({
      type: "POST",
      url: this.action,
      data: $(this).serialize(),

      success: function(json){
        item = new Item(json);
        result = Item.template(item);
        Item.appendToTop(result)
    }
  })
  });
});

$(function(){
  $("div.all-things-inlist").on("submit", "form.destroy_button", function(event) {
    event.preventDefault();
    $.ajax({
      type: "DELETE",
      url: this.action,
      data: $(this).serialize(),
      success: function(response){
        $("div#item-text"+response.id).remove();
        incrementLevel();
      }
    })
  })
});
//update the bar with new exp(currentLevel)
// if that currentLevel/100.floor > displayed level
//we will update displayed Level
function incrementLevel (){
  let currentLevel = Number($("a#user_level_data").text()) + 1;
  let level = Math.floor(currentLevel / 10) + 1;
  let exp = ((currentLevel % 10) * 10);

  $("a#user_level").text(`Level: ${level}`);
  $("a#user_level_data").text(currentLevel)
  $('div#theprogressbar').attr('aria-valuenow', exp).css('width',(exp + "%"));
}

$(function () {
  $("#button_for_new_items").on("click", function() {
      event.preventDefault();
      // alert("it works");
      let currentListId = parseInt($("#button_for_new_items").attr("data-list-id"));
      let userId = parseInt($("#button_for_new_items").attr("data-user-id"))

      $.get(`/users/${userId}/lists/${currentListId}.json`, function(data) {

      items_array = data.items
      items_array.sort(Item.compareByDescription);
      Item.getItems(items_array);
     });
  });
});

//when you first arrive on the list show page, when you create a new item on that list, it will show the html

// $(function(){
//   $("input.col-offset-2:checkbox").on("change", function(){
//     $(this).parents("form").trigger("submit")
//   })
// });

// alert( "Handler for .submit() called." );

// .done(function(data){
//   console.log(data)
// })

// .error(function(notNeeded){
//   alert("we broke")
// });

// $(function(){
//   $("#enter_new_item").submit(function(event) {
//
//     url = this.action
//     //the data sent has to match the controller allows params + db table
//     data = {
//       'authenticity_token': $("input[name='authenticity_token']").attr("value"),
//       'item':{
//         'description': $('.enter_new_item').val()
//       }
//     }
//     $.ajax({
//       method: "POST",
//       url: url,
//       data: data,
//       success: function(response){
//         let $div = $("div.all-items-inlist")
//         $div.append(response);
//     }})
//     event.preventDefault();
//   });
// });
// all-items-template

$(function () {
  $(".js-next").on("click", function() {
    event.preventDefault();
    let currentListId = parseInt($(".js-next").attr("data-list-id"));
    let userId = parseInt($(".js-next").attr("data-user-id"))
    let userLists = JSON.parse($(".js-next").attr("data-lists"))


    if (currentListId == userLists[userLists.length - 1] ) {
      alert("no more lists - next");
    }
    else {
      let currentListIdIndex = userLists.indexOf(currentListId)
      let newListId = userLists[currentListIdIndex + 1]
      $.get(`/users/${userId}/lists/${newListId}.json`, function(data) {
        $("#next_back_title").text(data["name"]);
        // re-set the id to current on the link
        $(".js-next").attr("data-list-id", data["id"]);
        $(".js-back").attr("data-list-id", data["id"]);
      });
    }
  });
});

$(function () {
  $(".js-back").on("click", function() {
    event.preventDefault();
    let currentListId = parseInt($(".js-back").attr("data-list-id"));
    let userId = parseInt($(".js-back").attr("data-user-id"))
    let userLists = JSON.parse($(".js-back").attr("data-lists"))
    //array of users lists
    // let currentindex = userLists.indexOf(currentListId)
    if (currentListId == userLists[0] ) {
      alert("no more lists - back");
    }
    else {
      let currentListIdIndex = userLists.indexOf(currentListId)
      let newListId = userLists[currentListIdIndex - 1]
      $.get(`/users/${userId}/lists/${newListId}.json`, function(data) {
        $("#next_back_title").text(data["name"]);
        // re-set the id to current on the link
        $(".js-next").attr("data-list-id", data["id"]);
        $(".js-back").attr("data-list-id", data["id"]);
      });
    }
  });
});

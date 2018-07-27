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
        $("#next_back_title").text(data.name);
        $("#next_back_title_p").text(data.user.duck);
        // debugger
        // next_back_title_p
        // re-set the id on the link
        $(".js-next").attr("data-list-id", data.id);
        $(".js-back").attr("data-list-id", data.id);
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
    if (currentListId == userLists[0] ) {
      alert("no more lists - back");
    }
    else {
      let currentListIdIndex = userLists.indexOf(currentListId)
      let newListId = userLists[currentListIdIndex - 1]
      $.get(`/users/${userId}/lists/${newListId}.json`, function(data) {
        $("#next_back_title").text(data["name"]);
        $("#next_back_title_p").text(data.user.duck);
        // re-set the id on the link
        $(".js-next").attr("data-list-id", data["id"]);
        $(".js-back").attr("data-list-id", data["id"]);
      });
    }
  });
});

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



function loadIssue() {
  var issue = {
    state: "closed",
    number: 5,
    created_at: "2016-03-31 16:23:13 UTC",
    body: "Instructions say GET /team and POST /newteam. Rspec wants GET/newteam and POST/team."
  }

  var template = Handlebars.compile(document.getElementById("item-template").innerHTML);
  var result = template(issue);
  document.getElementsByTagName("main")[0].innerHTML += result;
}

$(function(){
  $("#enter_new_item").submit(function(event) {
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

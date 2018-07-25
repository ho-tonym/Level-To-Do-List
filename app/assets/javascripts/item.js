$(function(){
  $("#enter_new_item").submit(function(event) {
    $.ajax({
      type: ($("input[name='_method']").val() || this.method),
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

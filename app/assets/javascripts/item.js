$(function(){
  $("#enter_new_item").submit(function(event) {

    url = this.action
    //the data sent has to match the controller allows params + db table
    data = {
      'authenticity_token': $("input[name='authenticity_token']").attr("value"),
      'item':{
        'description': $('.enter_new_item').val()
      }
    }
    $.ajax({
      method: "POST",
      url: url,
      data: data,
      success: function(response){
        $('.enter_new_item').val("")
        let $div = $("div.all-items-inlist")
        $div.append(response);
    }})
    event.preventDefault();
  });
});

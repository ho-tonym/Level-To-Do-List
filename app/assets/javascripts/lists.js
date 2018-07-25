// $(function(){
//   $("input.col-offset-2:checkbox").on("change", function(){
//     $(this).parents("form").trigger("submit")
//   })
// });


// $('.edit-item').on('click', function () {
//   console.log("hello")
//     // $('#SmallSquarePhoto').toggleClass('green-border', $(this).is(':checked'));
// });
//
// $(document).ready(function()) {
//   var $checkboxes = $('input[name="item[status]"]');
//   console.dir($checkboxes);
//   $checkboxes.change(function(){
//     console.log("hello")
//   })
// }

// $('#myCheckbox').prop('checked', true); // Checks it
// $('#myCheckbox').prop('checked', false); // Unchecks it
// $(".pages.contact").click(function() {
//   console.log("only runs on the contact page!")
// })

// enter_new_item, new_list


// $(document).ready(function(){
//   $("#enter_new_item").submit(function( event ) {
//     debugger;
//     alert( "Handler for .submit() called." );
//     event.preventDefault();
//   });
// });
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
        let $div = $("div.all-items-inlist")
        $div.append(response);
    }})
    // alert( "Handler for .submit() called." );

    // .done(function(data){
    //   console.log(data)
    // })

    // .error(function(notNeeded){
    //   alert("we broke")
    // });
    event.preventDefault();
  });
});

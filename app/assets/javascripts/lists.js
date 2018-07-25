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

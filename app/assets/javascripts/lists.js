$(function(){
  $("input.edit_item").on("change", function(){
    $(this).parents("form").trigger("submit")
  })
});

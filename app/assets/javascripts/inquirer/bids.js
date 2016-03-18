// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $(".new-bid").click(function(){
    var job_id = $(this).data("job-id");
    console.log($('#modal-bid form').attr('action', '/jobs/' + job_id + '/bids'))
  });
});
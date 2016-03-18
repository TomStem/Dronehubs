// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $(".js-jobs-new-bid").click(function(){
    var job_id = $(this).data("job-id");
    var form = $('.js-jobs-new-bid-form[data-job-id="' + job_id + '"]');
    $(form).show();
    return false;
  });
});
$(document).ready(function() {
  $(".new-job").click(function(){
    console.log($('#modal-job form').attr('action', '/jobs/' + job_id + '/jobs'))
  });
});
function CallToAction(){
   days=30;
   myDate = new Date();
   myDate.setTime(myDate.getTime()+(days*24*60*60*1000));
   document.cookie = 'CallToAction=Accepted; expires=' + myDate.toGMTString();
}

var cookie = document.cookie.split(';')
    .map(function(x){ return x.trim().split('='); })
    .filter(function(x){ return x[0]==='CallToAction'; })
    .pop();

if(cookie && cookie[1]==='Accepted') {
  $("#call-to-action").hide();
}

$('.accept-button a').on('click', function(){
    CallToAction();
     $("#call-to-action").hide();
    return false;
}); 
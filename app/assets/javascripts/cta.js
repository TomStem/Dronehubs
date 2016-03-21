function TermsAndConditions(){
   days=30;
   myDate = new Date();
   myDate.setTime(myDate.getTime()+(days*24*60*60*1000));
   document.cookie = 'TermsAndConditions=Accepted; expires=' + myDate.toGMTString();
}

var cookie = document.cookie.split(';')
    .map(function(x){ return x.trim().split('='); })
    .filter(function(x){ return x[0]==='TermsAndConditions'; })
    .pop();

if(cookie && cookie[1]==='Accepted') {
    $("#terms-and-conditions").hide();
}

$('.accept-button a').on('click', function(){
    TermsAndConditions();
     $("#terms-and-conditions").hide();
    return false;
}); 
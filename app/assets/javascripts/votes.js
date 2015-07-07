jQuery(document).ready(function($) {
  //Tell Rails that we’re sending a JavaScript request
  $.ajaxSetup({
     'beforeSend': function (xhr){
     xhr.setRequestHeader("Accept", "text/javascript")}
  });

  //General helper for forms submitted via ajax
  $("form.upvote-submit").submit(function (){
     $('input[type=submit]').attr('disabled', 'disabled');
     $.post($(this).attr('action'), $(this).serialize(), null, "script");
     return false;
  });

  $("form.downvote-submit").submit(function (){
     $('input[type=submit]').attr('disabled', 'disabled');
     $.post($(this).attr('action'), $(this).serialize(), null, "script");
     return false;
  });
}); //document.ready

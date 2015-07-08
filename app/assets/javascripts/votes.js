$(document).ready(function() {
  $(".upvote a").click(function( event ) {
    event.preventDefault();
    alert("test");
    var reviewId = $(this).attr("id").match(/upvote-([0-9]+)/)[1];
    // $form = $(event.currentTarget);
    // alert('Review upvoted!');
    // grab id and replaceWith(score)
    // make submit button a link instead

    var score = document.getElementById("review-" + reviewId + "-score").innerHTML;
    score = parseInt(score);
    score++;
    document.getElementById("review-" + reviewId + "-score").textContent = score;
    // also hide upvote button
    var url = '/reviews/' + reviewId + '/upvotes';
    // var url = '/reviews/1/upvotes';
    $(this).attr("data-method", "delete");
    $(this).attr("href", "/reviews/" + reviewId + "/upvotes/" + 1)
    $(this).text("Delete Upvote");

    // // Create the new form
    // $newForm = $('<a>').attr({
    //   url: url,
    //   method: 'delete',
    //   'data-upvote-button': 'delete'
    // });
    //
    // // $(this).html("Delete Upvote")
    //
    // // Create the new submit input
    // $upvoteButton = $('<input>').attr({type: 'submit', value: 'Remove Upvote'});
    //
    // // Append the new submit input to the new form
    // $newForm.append($upvoteButton);
    //
    // // Replace the old create form with the new remove form
    // $form.replaceWith($newForm);

    $.ajax({
      type: "POST",
      url: url,
      dataType: "json",
      success: function(upvote) {
        alert("Got the post request to hit the right controller");
      }
    });
  });
  $('[data-downvote-button="create"]').click(function( event ) {
    event.preventDefault();
    event.stopPropagation();
    var reviewId = $(this).attr("id").match(/review-([0-9]+)/)[1];

    // alert('Review upvoted!');
    // grab id and replaceWith(score)
    // make submit button a link instead

    var score = document.getElementById("review-" + reviewId + "-score").innerHTML;
    score = parseInt(score);
    score--;
    document.getElementById("review-" + reviewId + "-score").textContent = score;
    // also hide upvote button
    var url = '/reviews/' + reviewId + '/downvotes';
    // var url = '/reviews/1/upvotes';

    // Create the String version of the form action
    //
    // Create the new form
    $newForm = $('<form>').attr({
      action: action,
      method: 'delete',
      'data-downvote-button': 'delete'
    });

    // Create the new submit input
    $downvoteButton = $('<input>').attr({type: 'submit', value: 'Remove Downvote'});

    // Append the new submit input to the new form
    $newForm.append($downvoteButton);

    // Replace the old create form with the new remove form
    $form.replaceWith($newForm);

    $.ajax({
      type: "POST",
      url: $form.attr('action'),
      dataType: "json",
      success: function(downvote) {
        alert("Got the post request to hit the right controller");
      }
    });
  });
});

$(document).ready(function() {
  $('[data-upvote-button="create"]').on('click', function(event) {
    event.preventDefault();
    $form = $(event.currentTarget);
    // alert('Review upvoted!');
    // grab id and replaceWith(score)
    // make submit button a link instead

    var score = document.getElementById("review-4-score").innerHTML;
    score = parseInt(score);
    score++;
    document.getElementById("review-4-score").textContent = score;
    // also hide upvote button
    var url = '/reviews/' + upvote.review_id + '/upvotes/'+ upvote.id;
    // var url = '/reviews/4/upvotes';

    // Create the String version of the form action
    //
    // Create the new form
    $newForm = $('<form>').attr({
      action: action,
      method: 'delete',
      'data-upvote-button': 'delete'
    });

    // Create the new submit input
    $upvoteButton = $('<input>').attr({type: 'submit', value: 'Remove Upvote'});

    // Append the new submit input to the new form
    $newForm.append($upvoteButton);

    // Replace the old create form with the new remove form
    $form.replaceWith($newForm);

    $.ajax({
      type: "POST",
      // url: $form.attr('action'),
      url: url,
      dataType: "json",
      success: function(upvote) {
        // alert("Got the post request to hit the right controller");
        debugger;
      }
    });
  });
  $('[data-downvote-button="create"]').on('click', function(event) {
    event.preventDefault();
    $form = $(event.currentTarget);
    // alert('Review downvoted!');

    $.ajax({
      type: "POST",
      url: $form.attr('action'),
      dataType: "json",
      success: function(downvote) {
        // Create the String version of the form action
        action = '/reviews/' + downvote.review_id + '/downvotes/'+ downvote.id;

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
      }
    });
  });
});

$(document).ready(function() {
  $('[data-upvote-button="create"]').on('submit', function(event) {
    event.preventDefault();
    $form = $(event.currentTarget);
    // alert('Review upvoted!');

    $.ajax({
      type: "POST",
      url: $form.attr('action'),
      dataType: "json",
      success: function(upvote) {
        // Create the String version of the form action
        action = '/reviews/' + upvote.review_id + '/upvotes/'+ upvote.id;

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
      }
  });
  $('[data-downvote-button="create"]').on('submit', function(event) {
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

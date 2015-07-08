$(document).ready(function() {
  $(".upvote").on("click", function( event ) {
    event.preventDefault();
    event.stopPropagation();

    var reviewId = event.toElement.className.slice(14);

    var score = document.getElementById("review-" + reviewId + "-score").innerHTML;
    score = parseInt(score);
    score++;
    document.getElementById("review-" + reviewId + "-score").textContent = score;

    // also hide upvote button
    var url = '/reviews/' + reviewId + '/upvotes';
    $.ajax({
      type: "POST",
      url: url,
      dataType: "json",
      complete: function(upvote) {
        var upvoteId = JSON.parse(upvote.responseText)["id"];
        var reviewClass = ".upvote.review-" + reviewId;
        $(reviewClass).attr("data-method", "delete");
        $(reviewClass).attr("href", "/reviews/" + reviewId + "/upvotes/" + upvoteId);
        $(reviewClass).text("Delete Upvote");
      }
    });
  });
  $(document).ready(function() {
    $(".downvote").on("click", function( event ) {
      event.preventDefault();
      event.stopPropagation();

      var reviewId = event.toElement.className.slice(14);

      var score = document.getElementById("review-" + reviewId + "-score").innerHTML;
      score = parseInt(score);
      score++;
      document.getElementById("review-" + reviewId + "-score").textContent = score;

      // also hide downvote button
      var url = '/reviews/' + reviewId + '/downvotes';
      $.ajax({
        type: "POST",
        url: url,
        dataType: "json",
        complete: function(downvote) {
          var downvoteId = JSON.parse(downvote.responseText)["id"];
          var reviewClass = ".downvote.review-" + reviewId;
          $(reviewClass).attr("data-method", "delete");
          $(reviewClass).attr("href", "/reviews/" + reviewId + "/downvotes/" + downvoteId);
          $(reviewClass).text("Delete Downvote");
        }
      });
    });
});

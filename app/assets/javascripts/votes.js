$(document).ready(function() {
  var flag = true;
  var flag2 = true;
  $(".upvote").on("click", function( event ) {
    var reviewId = event.toElement.className.match(/\d+/)[0];
    var score = document.getElementById("review-" +
      reviewId +
      "-score"
    ).innerHTML;
    score = parseInt(score);

    if (flag) {
      event.preventDefault();
      event.stopPropagation();

      score++;
      document.getElementById("review-" + reviewId + "-score").textContent = score;

      // also hide upvote button
      var postUrl = "/reviews/" + reviewId + "/upvotes";

      $.ajax({
        type: "POST",
        url: postUrl,
        dataType: "json",
        complete: function() {
          var reviewClass = ".review-" + reviewId + ".upvote";
          $(reviewClass).attr("data-method", "delete");
          $(reviewClass).text("Delete Upvote");
        }
      });
    } else {
      event.preventDefault();
      event.stopPropagation();

      score--;
      document.getElementById("review-" + reviewId + "-score").textContent = score;

      var reviewClass = ".review-" + reviewId + ".upvote";
      var upvoteId = $(reviewClass).attr("href").match(/\d+/)[0];

      // also hide upvote button
      var delUrl = "/reviews/" + reviewId + "/upvotes/" + upvoteId;

      $.ajax({
        type: "DELETE",
        url: delUrl,
        dataType: "json",
        complete: function() {
          $(reviewClass).attr("data-method", "post");
          $(reviewClass).text("Upvote");
        }
      });
    }
    flag = !flag;
  });

  $(".downvote").on("click", function( event ) {
    var reviewId = event.toElement.className.match(/\d+/)[0];
    var score = document.getElementById("review-" +
      reviewId +
      "-score"
    ).innerHTML;
    score = parseInt(score);

    if (flag2) {
      event.preventDefault();
      event.stopPropagation();

      score--;
      document.getElementById("review-" + reviewId + "-score").textContent = score;

      // also hide downvote button
      var postUrl = "/reviews/" + reviewId + "/downvotes";

      $.ajax({
        type: "POST",
        url: postUrl,
        dataType: "json",
        complete: function() {
          var reviewClass = ".review-" + reviewId + ".downvote";
          $(reviewClass).attr("data-method", "delete");
          $(reviewClass).text("Delete Downvote");
        }
      });
    } else {
      event.preventDefault();
      event.stopPropagation();

      score++;
      document.getElementById("review-" + reviewId + "-score").textContent = score;

      var reviewClass = ".review-" + reviewId + ".downvote";
      var downvoteId = $(reviewClass).attr("href").match(/\d+/)[0];

      // also hide downvote button
      var delUrl = "/reviews/" + reviewId + "/downvotes/" + downvoteId;

      $.ajax({
        type: "DELETE",
        url: delUrl,
        dataType: "json",
        complete: function() {
          $(reviewClass).attr("data-method", "post");
          $(reviewClass).text("Downvote");
        }
      });
    }
    flag2 = !flag2;
  });
});

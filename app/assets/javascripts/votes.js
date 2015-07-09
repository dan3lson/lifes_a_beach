$(document).ready(function() {
  $(".upvote").on("click", function( event ) {
    event.preventDefault();
    event.stopPropagation();

    var reviewId = event.toElement.className.match(/\d+/)[0];

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
        var reviewClass = ".review-" + reviewId + ".upvote";
        $(reviewClass).attr("data-method", "delete");
        $(reviewClass).attr("href", "/reviews/" + reviewId + "/upvotes/" + upvoteId);
        $(reviewClass).text("Delete Upvote");
        $(reviewClass).addClass( "upvoted" );
        $(reviewClass).removeClass( "upvote" );
      }
    });
  });
  $(".upvoted").on("click", function( event ) {
    event.preventDefault();
    event.stopPropagation();

    var reviewId = event.toElement.className.match(/\d+/)[0];

    var score = document.getElementById("review-" + reviewId + "-score").innerHTML;
    score = parseInt(score);
    score--;
    document.getElementById("review-" + reviewId + "-score").textContent = score;

    var reviewClass = ".review-" + reviewId + ".upvoted";
    var upvoteId = $(reviewClass).attr("href").match(/\d+$/)[0];

    // also hide upvote button
    var url = '/reviews/' + reviewId + '/upvotes/' + upvoteId;

    $.ajax({
      type: "DELETE",
      url: url,
      dataType: "json",
      complete: function(upvote) {
        $(reviewClass).attr("data-method", "post");
        $(reviewClass).text("Upvote");
        $(reviewClass).addClass( "upvote" );
        $(reviewClass).removeClass( "upvoted" );
      }
    });
  });
  $(".downvote").on("click", function( event ) {
    event.preventDefault();
    event.stopPropagation();

    var reviewId = event.toElement.className.match(/\d+/)[0];

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
        var reviewClass = ".review-" + reviewId + ".downvote";
        $(reviewClass).attr("data-method", "delete");
        $(reviewClass).attr("href", "/reviews/" + reviewId + "/downvotes/" + downvoteId);
        $(reviewClass).text("Delete Downvote");
        $(reviewClass).addClass( "downvoted" );
        $(reviewClass).removeClass( "downvote" );
      }
    });
  });
  $(".downvoted").on("click", function( event ) {
    event.preventDefault();
    event.stopPropagation();

    var reviewId = event.toElement.className.match(/\d+/)[0];

    var score = document.getElementById("review-" + reviewId + "-score").innerHTML;
    score = parseInt(score);
    score--;
    document.getElementById("review-" + reviewId + "-score").textContent = score;

    var reviewClass = ".review-" + reviewId + ".downvoted";
    var downvoteId = $(reviewClass).attr("href").match(/\d+$/)[0];

    // also hide downvote button
    var url = '/reviews/' + reviewId + '/downvotes/' + downvoteId;

    $.ajax({
      type: "DELETE",
      url: url,
      dataType: "json",
      complete: function(downvote) {
        $(reviewClass).attr("data-method", "post");
        $(reviewClass).text("Downvote");
        $(reviewClass).addClass( "downvote" );
        $(reviewClass).removeClass( "downvoted" );
      }
    });
  });
});

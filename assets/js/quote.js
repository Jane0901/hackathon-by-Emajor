$(document).ready(function() {

  var quotes = ["Thanks for the job you did", "Made my website look awesome online", "Took my business online"];
  var author = ["by 貼心的團隊", "by 用心的團隊", "by 細心的團隊"];

  $('.button').click(function() {

    randomNum = Math.floor(Math.random() * quotes.length);

    $("#quote").text(quotes[randomNum]);

    $("#author").text(author[randomNum]);
});

});
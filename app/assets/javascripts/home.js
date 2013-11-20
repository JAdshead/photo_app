$(function() {
  $(".background-home-grid-photo").hide();

  $(".home-grid-photo").on("mouseover", function() {
    $(this).children(".background-home-grid-photo").show();
  });

  $(".home-grid-photo").on("mouseleave", function() {
    $(this).children(".background-home-grid-photo").hide();
  });
});




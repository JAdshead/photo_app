$(function() {
  $(".background-home-grid-photo").hide();

  $(".home-grid-photo").on("mouseover", function() {
    $(this).children(".background-home-grid-photo").show();
  });

  $(".home-grid-photo").on("mouseleave", function() {
    $(this).children(".background-home-grid-photo").hide();
  });

  $(".add-album-plus").on("click", function() {
    $(this).hide();
    $( ".profile-grid-photo.add form" ).fadeIn(200);
    $(".profile-grid-photo.add form").fadeIn(500);
    $(".profile-grid-photo.add").animate({height: "29em"}, 500);
  });

});




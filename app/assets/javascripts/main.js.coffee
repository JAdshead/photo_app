
$ ->
  
  # tags js
  $('#photo_tags_list').select2({tags:[]})

  # epic search feature
  $overlay = $('.overlay')
  $('.search').on 'click', =>
    if $overlay.is(':visible')
      $overlay.fadeOut();
    else
      $overlay.fadeIn();

  $('.search').on 'hover', =>

  $('.close').on 'click', =>
    $overlay.fadeOut();

  # show hide add photo form
  $

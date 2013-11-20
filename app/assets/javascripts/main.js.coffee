
$ ->

  ->
    $('#photo_tags_list').select2({tags:[]})

  $overlay = $('.overlay')
  $('.search').on 'click', =>
    if $overlay.is(':visible')
      $overlay.fadeOut();
    else
      $overlay.fadeIn();

  $('.search').on 'hover', =>

  $('.close').on 'click', =>
    $overlay.fadeOut();

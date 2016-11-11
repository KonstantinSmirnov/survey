jQuery ($) ->
  $(document).on "turbolinks:load", ->
    $(".notification").delay(3000).fadeOut()

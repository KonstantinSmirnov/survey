jQuery ($) ->
  $(document).on "turbolinks:load", ->
    $(".notification").delay(5000).fadeOut()

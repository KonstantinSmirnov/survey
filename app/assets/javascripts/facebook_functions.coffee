jQuery ($) ->
  $(document).on "turbolinks:load", ->

    @share_facebook = (link, title, description, caption) ->
      FB.ui
        method      : 'feed'
        link        : link
        name        : title
        description : description
        caption     : caption

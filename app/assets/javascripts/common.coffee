jQuery ($) ->
  $(document).on "turbolinks:load ajaxComplete", ->
    $(".notification").delay(5000).fadeOut()
    $(".delete_answer_variant").on "click", ->
      $(this).prev('input[type=hidden]').val('1')
      $(this).closest('.input-group').hide()
      event.preventDefault()

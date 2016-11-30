jQuery ->
  $(document).on "turbolinks:load ajaxComplete", ->
    $('#surveys').sortable
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))
    $('#questions').sortable
      update: ->
        $.post($(this).data('update-url'), $(this).sortable('serialize'))
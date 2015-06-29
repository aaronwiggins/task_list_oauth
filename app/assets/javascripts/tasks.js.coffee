# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  if $('#sortable').length > 0
    table_width = $('#sortable').width()
    cells = $('.table').find('tr')[0].cells.length
    desired_width = table_width / cells + 'px'
    $('.table td').css('width', desired_width)

    $('#sortable').sortable(
      axis: 'y'
      items: '.item'
      cursor: 'move'

      sort: (e, ui) ->
        ui.item.addClass('active-item-shadow')
      stop: (e, ui) ->
        ui.item.removeClass('active-item-shadow')
        ui.item.children('td').effect('highlight', {}, 1000)
      update: (e, ui) ->
        item_id = ui.item.data('item-id')
        console.log(item_id)
        position = ui.item.index()
        $.ajax(
          type: 'POST'
          url: '/tasks/update_row_order'
          dataType: 'json'
          data: { task: {id: item_id, order_number_position: position } }
        )
    )

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(window).load ->
  $('a[data-target]').click (e) ->
    e.preventDefault()
    $this = $(this)
    if $this.data('target') == 'Add to'
      url = $this.data('addurl')
      new_target = "Remove from"
    else
      url = $this.data('removeurl')
      new_target = "Add to"
    $.ajax url: url, type: 'put', success: (data) ->
      $('.cart-count').html(data)
      $this.find('span').html(new_target)
      $this.data('target', new_target)
      
  $('#preview').on 'click', ->
    link = $('#movie_poster_url').val()
    $('#poster-preview').attr('src', link)


change_count = (tag) ->
  id = $(tag).attr('id')[22..-1]
  val = $(tag).val()
  console.log id, val
  $.post '/movies/change_count',
    id: id
    count: val


$(document).ready ->
  $('.movie-field').on 'change', (event) ->
    change_count(event.target)
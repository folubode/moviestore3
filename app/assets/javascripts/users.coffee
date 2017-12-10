# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
toggle_role = (tag) ->
  id = $(tag).attr('id')[5..-1]
  val = $(tag).val()
  console.log id, val
  $.post '/roles/change_role',
    id: id
    role: val


$(document).ready ->
  $('.role-select').on 'change', (event) ->
    toggle_role(event.target)
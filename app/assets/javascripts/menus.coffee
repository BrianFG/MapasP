# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/





$().ready ->
  $('#select_all').change ->
    checkboxes = $(this).closest('form').find(':checkbox')
    if $(this).is(':checked')
      checkboxes.prop 'checked', true
    else
      checkboxes.prop 'checked', false
    return
  return


$().ready ->
  initialize = undefined
  map = undefined
  map = undefined

  initialize = ->
    mapOptions = undefined
    mapOptions =
      center: new (google.maps.LatLng)(20, -100)
      zoom: 7
      mapTypeId: google.maps.MapTypeId.ROADMAP
    map = new (google.maps.Map)(document.getElementById('map_canvas'), mapOptions)
    return

  initialize()
  $.getJSON '/menus/markers.json', { puntos: puntos }, (json1) ->
    $.each json1, (key, data) ->
      latLng = undefined
      marker = undefined
      latLng = new (google.maps.LatLng)(data.lat, data.lng)
      marker = new (google.maps.Marker)(
        position: latLng
        title: data.title)
      marker.setMap map
      return
    return
  return
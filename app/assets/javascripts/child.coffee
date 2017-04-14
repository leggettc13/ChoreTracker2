# FULL CALENDAR STUFF HERE
# MODIFY CHILD CALENDAR CSS IN ./stylesheets/child.scss

initialize_calendar = undefined

initialize_calendar = ->
  $('.calendar').each ->
    calendar = $(this)
    calendar.fullCalendar
    
      defaultView: 'month'
      contentHeight: 'auto'
      header:
        left: 'prev,next today'
        center: 'title'
        right: 'month,basicWeek,basicDay'
      events: '/chores.json'
      
      #function to alert chore.ID
      
      # eventClick: (calEvent, jsEvent, view) ->
      #   alert 'Chore ID: ' + calEvent.id
      #   alert 'Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY
      #   alert 'View: ' + view.name
      #   # change the border color just for fun
      #   $(this).css 'border-color', 'red'
      #   return
      
      
      # Redirect to Chore Show page on click
      eventClick: (calEvent, jsEvent, view) ->
        $buildURL = '/chores/' + calEvent.id
        window.location.href = $buildURL
        return
        
    return
  return
  
  

 
$(document).on 'turbolinks:load', initialize_calendar

# initialize_calendar = undefined

# initialize_calendar = ->
#   $('.calendar').each ->
#     calendar = $(this)
#     calendar.fullCalendar
#       header:
#         left: 'prev,next today'
#         center: 'title'
#         right: 'month,agendaWeek,agendaDay'
#       selectable: true
#       selectHelper: true
#       editable: true
#       eventLimit: true
#       events: '/events.json'
#       select: (start, end) ->
#         $.getScript '/events/new', ->
#           $('#event_date_range').val moment(start).format('MM/DD/YYYY HH:mm') + ' - ' + moment(end).format('MM/DD/YYYY HH:mm')
#           date_range_picker()
#           $('.start_hidden').val moment(start).format('YYYY-MM-DD HH:mm')
#           $('.end_hidden').val moment(end).format('YYYY-MM-DD HH:mm')
#           return
#         calendar.fullCalendar 'unselect'
#         return
#       eventDrop: (event, delta, revertFunc) ->
#         event_data = event:
#           id: event.id
#           start: event.start.format()
#           end: event.end.format()
#         $.ajax
#           url: event.update_url
#           data: event_data
#           type: 'PATCH'
#         return
#       eventClick: (event, jsEvent, view) ->
#         $.getScript event.edit_url, ->
#           $('#event_date_range').val moment(event.start).format('MM/DD/YYYY HH:mm') + ' - ' + moment(event.end).format('MM/DD/YYYY HH:mm')
#           date_range_picker()
#           $('.start_hidden').val moment(event.start).format('YYYY-MM-DD HH:mm')
#           $('.end_hidden').val moment(event.end).format('YYYY-MM-DD HH:mm')
#           return
#         return
#     return
#   return

# $(document).on 'turbolinks:load', initialize_calendar

# # ---
# generated by js2coffee 2.2.0

 #  www.js2.coffee




$(document).on 'turbolinks:load', ->
  (($) ->
    $('.tab ul.tabs').addClass('active').find('> li:eq(0)').addClass 'current'
    $('.tab ul.tabs li a').click (g) ->
      tab = $(this).closest('.tab')
      index = $(this).closest('li').index()
      tab.find('ul.tabs > li').removeClass 'current'
      $(this).closest('li').addClass 'current'
      tab.find('.tab_content').find('div.tabs_item').not('div.tabs_item:eq(' + index + ')').slideUp()
      tab.find('.tab_content').find('div.tabs_item:eq(' + index + ')').slideDown()
      # #alert($(this).closest('li').index())
      # if ($(this).closest('li').index() is 4 )
      #   alert((index))
      #   $('#calendar').fullCalendar 'render'
      # # initialize_calendar
      g.preventDefault()
      return
    
    return
  ) jQuery
  return

# ---
# generated by js2coffee 2.2.0


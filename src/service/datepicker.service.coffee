# angular.module 'picstreet'

# .service '$datepicker', ($rootScope, Event, $stateParams) ->
	
# 	list = 
# 		date: moment()
# 		start: 0
# 		end: 20

# 	$rootScope.$on '$datepicker:date:near', (e, nearDate) ->
# 		console.log '#########################'
# 		console.log 'RECEIVE LIST DATE : ', nearDate.format('MM-DD-YYYY')
# 		console.log '#########################'
# 		if list.date.format('MM-DD-YYYY') isnt nearDate.format('MM-DD-YYYY')

# 			console.log list.date.format('MM-DD-YYYY') + ' isnt ' +nearDate.format('MM-DD-YYYY')
# 			list.date = nearDate
# 			list.start = -20
# 			list.end = 0
# 		else
# 			console.log list.date.format('MM-DD-YYYY') + ' is ' +nearDate.format('MM-DD-YYYY')
# 		console.log '#########################'
# 		console.log 'start: ', list.start
# 		console.log 'end: ', list.end
# 		console.log '#########################'

# 	$datepicker = 

# 		loadEventsFromDate: (date=undefined, callback=->) ->
# 			console.log '$datepicker:loadEventsFromDate '
# 			console.log 'date : ', date
# 			console.log 'list.date : ',list.date
# 			if date is undefined
# 				date = moment(list.date)

# 			console.log '$datepicker:loadEventsFromDate ', date.format('MM-DD-YYYY')
# 			console.log '|-------------------------------------------------|'
# 			console.log '| DATEPICKER LOAD EVENT ' + date.format('MM-DD-YYYY')
# 			console.log '|-------------------------------------------------|'
			
# 			if list.date.format('MM-DD-YYYY') is date.format('MM-DD-YYYY')
# 				console.log '| IF ' + list.date.format('MM-DD-YYYY') + ' is ' + date.format('MM-DD-YYYY')
# 				list.start += 20
# 				list.end += 20

# 			else
# 				console.log '| ELSE ' + list.date.format('MM-DD-YYYY') + ' isnt ' + date.format('MM-DD-YYYY')
# 				list.date = date
# 				list.start = 0
# 				list.end = 20

# 			console.log '| START  | ' + list.start
# 			console.log '|   END  | ' + list.end
# 			console.log '|  DATE  | ' + list.date.format('MM-DD-YYYY')
# 			Event.list 

# 				cityName: $stateParams.city
# 				fromDate: list.date.format('MM-DD-YYYY')
# 				start: list.start
# 				end: list.end

# 			, {}

# 			.$promise
# 			.then callback
				
# 		getDaysOfMonth: (month) ->
# 			console.log '$datepicker:getDaysOfMonth'
# 			days = []
# 			lastDay = moment()
# 			.month month
# 			.endOf 'month'
# 			.format 'D'

# 			for day in [1..parseInt lastDay]
# 				_day = moment()
# 				.set 'month', month
# 				.set 'date', day
# 				_day.formated = parseInt _day.format('D')
# 				days.push _day

# 			days

# 		groupEventsByDate: (events, callback=->) ->
# 			events.map (event) ->
# 				event.pictures.sort (a, b) ->
# 					a.index - b.index

# 			console.log '$datepicker:groupEventsByDate : ', events
# 			callback events.sort (a,b) -> 
# 				new Date(a.date).getTime() - new Date(b.date).getTime()


# 		groupEventBookingsByDate: (eventBookings, callback=->) ->
# 			eventBookings.map (eventBooking) ->
# 				console.log eventBooking
# 				eventBooking.event.pictures.sort (a, b) ->
# 					a.index - b.index

# 			console.log '$datepicker:groupEventBookingsByDate : ', eventBookings
			
# 			callback eventBookings.sort (a,b) -> 
# 				moment(a.event.date) - moment(b.event.date)

# 		fillEventBookingsDateArray: (eventBookings, dates, callback=->) ->
# 			console.log '$datepicker:fillDateArray'
			
# 			count = eventBookings.length			
# 			index = if dates.length is 0 then 0 else dates.length - 1
			
# 			for eventBooking in eventBookings
				
# 				if dates[index] is undefined
# 					dates[index] = 
# 						date: eventBooking.event.date
# 						events: [eventBooking]


# 				else if moment(dates[index].date).format('dddd D MMMM YYYY') isnt moment(eventBooking.event.date).format('dddd D MMMM YYYY')
# 					dates[++index] = 
# 						date: eventBooking.event.date
# 						events: [eventBooking]


# 				else 
# 					dates[index].events.push eventBooking

# 			callback dates, count

# 		fillDateArray: (events, dates, callback=->) ->
# 			console.log '$datepicker:fillDateArray'
			
# 			count = events.length
# 			labelHeight = 32
# 			eventHeight = window.innerHeight / 100 * 30


# 			if dates.length is 0 
# 				startY = 1

# 			else 
# 				startY = labelHeight + dates[dates.length - 1].startY + (dates[dates.length - 1].events.length * eventHeight)
			
# 			index = if dates.length is 0 then 0 else dates.length - 1
			

# 			for event in events
				
# 				if dates[index] is undefined
# 					dates[index] = 
# 						date: event.date
# 						events: [event]
# 						startY: startY

# 					startY += labelHeight + eventHeight

# 				else if moment(dates[index].date).format('dddd D MMMM YYYY') isnt moment(event.date).format('dddd D MMMM YYYY')
# 					dates[++index] = 
# 						date: event.date
# 						events: [event]
# 						startY: startY

# 					startY += labelHeight + eventHeight

# 				else 
# 					dates[index].events.push event
# 					startY += eventHeight

# 			callback dates, count







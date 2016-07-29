# angular.module 'picstreet'

# .service '$booking', (Action, Currency, $cordovaDialogs, $state, $ionicModal, $rootScope, $timeout, $filter, EventBooking) ->
	
# 	service  = 
		
# 		haveItems: (eventBooking) ->

# 			for categoryName, categoryValue of eventBooking.configuration
# 				for product in categoryValue
# 					if product.booking >= 1
						
# 						return true
# 			return false

# 		syncCurrencies: () ->
# 			Currency.getAll()
# 			.$promise
			

# 		currency: (eventBooking) -> eventBooking.currency
		
# 		finalAmountBeforeTaxe: (eventBooking) -> parseFloat(service.finalAmount(eventBooking) / (1 + (service.taxePercent(eventBooking) / 100))).toFixed 0
		
# 		finalAmount: (eventBooking) -> 
# 			if eventBooking.total > eventBooking.minSpend
# 				result = eventBooking.total 
			
# 			else
# 				result = eventBooking.minSpend

# 			return result += service.coverCharges(eventBooking)

# 		coverCharges: (eventBooking) -> 
# 			if eventBooking.coverCharges
# 				nbPersonApplyCoverCharges = eventBooking.men + eventBooking.women - eventBooking.coverChargesAppliedFrom
				
# 				if nbPersonApplyCoverCharges > 0
# 					return nbPersonApplyCoverCharges * eventBooking.coverCharges

			 
# 			return 0
		
# 		depositPercent: (eventBooking) -> eventBooking.deposit
# 		depositAmount: (eventBooking) -> $filter('deposit')(service.finalAmount(eventBooking), eventBooking.deposit)
		
# 		taxeAmount: (eventBooking) -> parseFloat(service.finalAmount(eventBooking) - service.finalAmountBeforeTaxe(eventBooking)).toFixed 0
# 		taxePercent: (eventBooking) -> eventBooking.taxe
		
# 		feesAmount: (eventBooking) -> $filter('fees')(service.finalAmount(eventBooking), service.feesPercent(eventBooking))
# 		feesPercent: (eventBooking) -> $filter('fees')(eventBooking)
		
# 		totalPrePaid: (eventBooking) -> (parseFloat(service.depositAmount(eventBooking)) + parseFloat(service.feesAmount(eventBooking))).toFixed 0
		
# 		cancel: (eventBooking) ->

# 			eventBooking.status = 'cancelled'
# 			EventBooking.upsert id: eventBooking.id, eventBooking
# 			.$promise
# 			.then (success) -> console.log 'success : ', success
# 			.catch (err) -> console.log 'err : ', err


			

# 		verify: (eventBooking, card) ->

# 			eventBooking.creditCardId = card.stripeId
# 			eventBooking.depositAmount = service.depositAmount eventBooking
# 			eventBooking.feesAmount = service.feesAmount eventBooking
# 			eventBooking.feesPercent = service.feesPercent eventBooking
# 			eventBooking.finalAmount = service.finalAmount eventBooking
# 			eventBooking.totalPrePaid = service.totalPrePaid eventBooking
# 			eventBooking.bookingDate = moment()
							
# 			EventBooking.create eventBooking

# 			.$promise
# 			.then (newEventBooking) -> 

# 				console.log 'NEW EVENT BOOKING', newEventBooking
# 				if newEventBooking.charge

# 					newEventBooking.event = eventBooking.event

# 					$rootScope.$broadcast 'loading:unlock'
					
# 					$rootScope.$broadcast '$booking:success', newEventBooking
# 					Action.create
# 						name: 'booking:success'
# 						data:
# 							eventId: eventBooking.event.id
# 							eventId: eventBooking.event.id
# 							eventName: eventBooking.event.name
# 							eventClubName: eventBooking.event.club.name
# 							eventClubId: eventBooking.event.club.id
# 							eventCityName: eventBooking.event.club.city.name
# 							eventBookingId: newEventBooking.id
# 					# $rootScope.$emit '$booking:success', newEventBooking

# 				else 
# 					# $rootScope.$emit '$booking:error'
# 					Action.create
# 						name: 'booking:failed'
# 						data:
# 							eventId: eventBooking.event.id
# 							eventId: eventBooking.event.id
# 							eventName: eventBooking.event.name
# 							eventClubName: eventBooking.event.club.name
# 							eventClubId: eventBooking.event.club.id
# 							eventCityName: eventBooking.event.club.city.name
# 							eventBookingId: newEventBooking.id

# 					$rootScope.$broadcast '$booking:error'

		
# .filter 'fees', ($rootScope) ->
# 	(eventBooking, percent) ->
# 			# console.log '|--------------------------------------------|'
# 			# console.log '| FILTER FEES : ', eventBooking, percent
# 			# console.log '|--------------------------------------------|'
# 			if typeof percent is 'string'

# 				return (eventBooking / 100 * percent).toFixed 0

# 			else if typeof percent is 'number'
# 				return (eventBooking / 100 * percent).toFixed 0
				
# 			else
					
# 				if $rootScope.me.city.countryId != eventBooking.event.club.city.countryId
				
# 					hours = moment(eventBooking.event.arrivalStart).hours()
# 					minutes = moment(eventBooking.event.arrivalStart).minutes()
# 					eventStartingDate = moment(eventBooking.event.date).hours(hours).minutes(minutes)
# 					date = if eventBooking.bookingDate then moment(eventBooking.bookingDate) else moment()
					
# 					T = trigger = eventBooking.event.feesIncrease * 3600 * 1000
# 					R = remainingTime = (eventStartingDate - date )
# 					FS = parseInt eventBooking.event.feesMin
# 					FE = parseInt eventBooking.event.feesMax
					
# 					return eventBooking.event.feesMin if R >= T 
# 					return eventBooking.event.feesMax if R <= T 
# 					return Math.ceil((100 / T) * (T - R) * ((FE - FS) / 100)) + FS if R < T
				
# 				else
# 					return 0


		
# .filter 'lisibility', ->
# 	(amount) ->
# 		# console.log '------- lisibility ------'
# 		x = amount.toString().split('').reverse()
# 		z = []
# 		for y, index in x
# 			if index % 3 is 0 
# 				z.push ' '
# 			z.push y

# 		console.log z
# 		z.reverse().join('')

# .filter 'add', ->
# 	(nb1, nb2) ->
# 		(parseFloat(nb1) + parseFloat(nb2)).toFixed 0

# .filter 'currency', ($rootScope) ->
# 	(data) ->
# 		console.log 'CURRENCY : ', $rootScope.me
# 		sign = switch $rootScope.me.city.country.currencies[0]
# 			when 'EUR' then '€'
# 			when 'CNY' then '¥'
# 			when 'USD' then '$'
# 			when 'GBP' then '£'
# 			else $rootScope.me.city.country.currencies[0]
# 		data + ' ' + sign

# .filter 'deposit', ($rootScope) ->
# 	(price, deposit) ->
# 		(price / 100 * deposit).toFixed 0

# .filter 'convertFrom', ($rootScope) ->
# 	(price, currency) ->
# 		# console.log '#################PRICE : ', price
# 		parseFloat((price / $rootScope.currencies[currency]) / (1 / $rootScope.currencies[$rootScope.me.city.country.currencies[0]])).toFixed 0

# .filter 'date', ->
# 	(date, format) ->
# 		moment.parseZone(date).add(2, 'hours').format(format)





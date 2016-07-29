# angular.module 'picstreet'

# .service '$rating', (Rating, EventBooking, $rootScope, $ionicPopover, $controller, $cordovaDialogs, $filter) ->

# 	$rating = 
# 		init: ->
# 			$rootScope.$on 'request:connect', (e, me) ->

# 				ratings = []

# 				if me and me.eventBookings and me.eventBookings.length > 0
# 					ratings = me.eventBookings.filter (eventBooking) ->
# 						if eventBooking.status is 'confirmed' #remplace by 'confirmed'
# 							if moment(eventBooking.bookingDate) > moment() # reverse < to >
# 								if eventBooking.rating is undefined
# 									return true
# 						return false

# 				console.log 'RATINGS : ', ratings

# 				for eventBooking in ratings
# 					$rating.open(eventBooking)

# 		open: (eventBooking) ->
			
# 			popoverScope = undefined
# 			popoverScope = $rootScope.$new()
# 			popoverScope.eventBooking = eventBooking

			
# 			$ionicPopover.fromTemplateUrl 'rating.view.html',
# 				scope: popoverScope

# 			.then (popover) ->
# 				console.log 'POPOVER : ', popover
				
# 				popover.scope.popover = popover

# 				popover.scope.rating =
# 					value: 0
# 					comment: ''

# 				popover.scope.valide = (rating) ->
# 					console.log 'EVENT BOOKING', popover.scope.eventBooking
					
# 					if rating.value
# 						newRating = 
# 							value: rating.value
# 							comment: rating.comment
# 							eventBookingId: popover.scope.eventBooking.id
						
# 						EventBooking.rating.create id: popover.scope.eventBooking.id
# 						, newRating
# 						.$promise
# 						.then (success) -> 
# 							console.log 'SUCCESS X : ', success
# 						.catch (err) -> console.log 'err : ', err
						
# 						ionic.requestAnimationFrame ->
# 							console.log popover.el
# 							popover.el.style.transition = 'all .3s ease'
# 							popover.el.style.backgroundColor = 'rgba(0, 0, 0, 0)'
# 							popover.el.querySelector '#rating'
# 							.classList.add 'leave'
							
# 							setTimeout ->
# 								popover.scope.popover.hide()
# 							, 800

# 						console.log 'valide rating : ', rating

# 					else
# 						$cordovaDialogs.alert $filter('translate')('ratingPopup'), 'Bottle Booking', 'Retry' 
						




# 				# console.log 'popover : ', popover
# 				popover.show() 

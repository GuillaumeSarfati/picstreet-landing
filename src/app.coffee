#------------------------------------------------
# __API_URL__ = "http://172.20.10.4:3000"
# __API_URL__ = "http://192.168.2.1:3000"
# __API_URL__ = "http://192.168.73.111:3000"
# __API_URL__ = "http://bottlebooking-dev778.eu-west-1.elasticbeanstalk.com"
__API_URL__ = "http://pixer-development.qffguhepgk.eu-west-1.elasticbeanstalk.com"
__API_URL__ = "http://localhost:3000" if window.location.href.match 'localhost'

console.log "%c[Pixer API] : #{__API_URL__}" , 'color: green;'

#------------------------------------------------
__rights =
	everyone: 0
	guest: 1
	member: 2
	admin: 3

__uptime = moment()

angular.module 'picstreet', [

	'ngResource'
	'ngCordova'
	'ngStorage'

	'ionic'
	'ionic.service.core'
	'ionic.service.push'
	'ionic-native-transitions'

	'lbServices'

	'ngIOS9UIWebViewPatch'
	'cwill747.phonenumber'

	'picstreet.translate'

	'picstreet.unauthenticated'

]
.config ($ionicNativeTransitionsProvider, $ionicConfigProvider, $cordovaFacebookProvider, $urlRouterProvider, LoopBackResourceProvider, $httpProvider) ->

	Intercom 'boot',
		app_id: "t1fie9we"
		
	$ionicConfigProvider.views.swipeBackEnabled(false)

	$ionicNativeTransitionsProvider.setDefaultOptions
		duration: 400, # in milliseconds (ms), default 400,
		slowdownfactor: 4, # overlap views (higher number is more) or no overlap (1), default 4
		iosdelay: -1, # ms to wait for the iOS webview to update before animation kicks in, default -1
		androiddelay: -1, # same as above but for Android, default -1
		winphonedelay: -1, # same as above but for Windows Phone, default -1,
		fixedPixelsTop: 0, # the number of pixels of your fixed header, default 0 (iOS and Android)
		fixedPixelsBottom: 0, # the number of pixels of your fixed footer (f.i. a tab bar), default 0 (iOS and Android)
		triggerTransitionEvent: '$ionicView.afterEnter', # internal ionic-native-transitions option
		backInOppositeDirection: false # Takes over default back transition and state back transition to use the opposite direction transition to go back
	 
	$ionicNativeTransitionsProvider.setDefaultTransition
		type: 'slide'
		direction: 'left'

	$ionicNativeTransitionsProvider.setDefaultBackTransition
		type: 'slide',
		direction: 'right'

	$urlRouterProvider.otherwise '/'

	LoopBackResourceProvider.setAuthHeader 'X-Access-Token'
	LoopBackResourceProvider.setUrlBase "#{__API_URL__}/api"

	# $httpProvider.interceptors.push 'loader'
	$httpProvider.defaults.useXDomain = true
	
	delete $httpProvider.defaults.headers.common['X-Requested-With']

.run ($ionicHistory, $ionicNativeTransitions, $rootScope, $state, $ionicPlatform, $cordovaStatusbar, $cordovaDialogs, $filter) ->

	# $rootScope.stateGo = (state, params={}) ->
	# 	$ionicNativeTransitions.stateGo state,
	# 		params
	# 	, 
	# 		type: "slide"
	# 		direction: "left"
	# 		duration: 400

	# $rootScope.stateGoBack = ->
	# 	console.log 'stateGoBack X'
	# 	console.log $ionicHistory.backView()
	# 	back = $ionicHistory.backView()
	# 	$ionicNativeTransitions.stateGo back.stateName
	# 	, back.stateParams
	# 	, 
	# 		type: "slide"
	# 		direction: "right"
	# 		duration: 400

	# $connect.remember (stateName) -> 
						
	# 	unless $rootScope.isOpenedByNotification
	# 		$ionicNativeTransitions.stateGo stateName, {},
	# 			type: "fade"
	# 			duration: 400

	$ionicPlatform.ready ->
		document.addEventListener "pause", ->
			console.log 'pause'
		document.addEventListener "resume", ->
			console.log 'resume'
			__uptime = moment()

	# $rating.init()
	
	# $booking.syncCurrencies()
	# .then (currencies) -> $rootScope.currencies = currencies
	# .catch (err) -> console.log 'err sync currencies: ', err

	# TODO : concat search into $search
	# $rootScope.searchIsOpen = false
	# $rootScope.searchIsVisible = false
	# $rootScope.q = ''

	$ionicPlatform.ready ->

		# $notification.request()
		# $notification.register()
		
		if window.cordova
			$cordovaStatusbar.styleColor('white')
			if window.cordova.plugins.Keyboard
				cordova.plugins.Keyboard.disableScroll true
				# cordova.plugins.Keyboard.hideKeyboardAccessoryBar false

	# $rootScope.search = ->
	# 	$rootScope.searchIsOpen = !$rootScope.searchIsOpen
	# 	unless $rootScope.searchIsOpen
	# 		$rootScope.q = ''
	# 	else $rootScope.$emit 'search:open'

	# $rootScope.goAndCloseSearch = (state=undefined) ->
	# 	$rootScope.searchIsOpen = false
	# 	$rootScope.q = ''
	# 	$ionicNativeTransitions.stateGo state, {}, 
	# 		type: "slide"
	# 		direction: "left"
	# 		duration: 400
		
	# $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState) ->
	# 	$rootScope.$emit 'update:indicator' if toState.name is 'authenticated.cities'

	# $rootScope.discoverMode = ->
	# 	if $rootScope.me
	# 		$cordovaDialogs.alert $filter('translate')('guestModePopup'), 'Bottle Booking', 'Ok'
	# 	else
	# 		$cordovaDialogs.confirm $filter('translate')('discoverModePopup'), 'Bottle Booking', [$filter('translate')('understandButton'), $filter('translate')('askButton')] 
	# 		.then (result) ->
					
	# 				button = if window.cordova then 2 else 1

	# 				if result is button

	# 					$bbModal.getAskForMembership {}, (modal, modalScope) ->
	# 						modalScope.show()

	# $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState) ->
	# 	states = [
	# 		'authenticated.events'
	# 	]

	# 	if toState.name in states
	# 		if $rootScope.me is undefined or $rootScope.me.status isnt 'activate'

	# 			event.preventDefault();
	# 			$rootScope.discoverMode()

# .run ($ionicPopover, $rootScope, $notification, $ionicNativeTransitions, $state) ->

# 	$notification

# 	#---------------------------------------------------
# 	# Chat Notification Configuration
# 	#---------------------------------------------------
# 	.type 'chat',

# 		state:
# 			#this param determine if notify or update
# 			name: 'authenticated.room'

# 			#link $stateParams.id to notification.additionalData.roomId
# 			paramsLink: id: 'roomId'
		
# 		# when the app is close or in background
# 		deep: (notification) ->
# 			console.log '----------------------'
# 			console.log 'deep : ', notification
# 			console.log '----------------------'
			
# 			if $rootScope.me
# 				# $state.go 'authenticated.room'
# 				# , { id: notification.additionalData.roomId }
# 				$ionicNativeTransitions.stateGo 'authenticated.room'
# 				, { id: notification.additionalData.roomId }
# 				, { type: "flip", direction: "left", duration: 400 }
# 				, { reload: true }
			
# 			else
			
# 				$rootScope.$on 'request:connect', ->
# 					$rootScope.isOpenedByNotification = true
# 					# $state.go 'authenticated.room'
# 					# , { id: notification.additionalData.roomId }
# 					$ionicNativeTransitions.stateGo 'authenticated.room'
# 					, { id: notification.additionalData.roomId }
# 					, { type: "flip", direction: "left", duration: 400 }
# 					, { reload: true }


# 		# when the app isn't in the good state
# 		notify: (notification) ->
# 			console.log '----------------------'
# 			console.log 'notify : ', notification
# 			console.log '----------------------'
			
# 			$notification.show notification,
# 				templateUrl: 'notification.chat.html'
# 				backdrop: false
				
# 				timeout: (notification, elem) =>
# 					elem.release()

# 				click: (notification, elem) =>
# 					elem.release()
# 					# You can redirect to @deep(notification) if is the same behavior
# 					$ionicNativeTransitions.stateGo 'authenticated.room'
# 					, { id: notification.additionalData.roomId }
# 					, { type: "slide", direction: "down", duration: 400 }
# 					, { reload: true }

# 		# when the app is in the good state
# 		update: (notification) ->
# 			console.log '----------------------'
# 			console.log 'update : ', notification
# 			console.log '----------------------'
# 			$rootScope.$broadcast "room:#{notification.additionalData.roomId}", notification

# 	#---------------------------------------------------
# 	# Event Notification Configuration
# 	#---------------------------------------------------

# 	.type 'event',
# 		state:
# 			name: 'authenticated.event'
# 			paramsLink: id: 'eventId'
		
# 		deep: (notification) ->

# 			$ionicNativeTransitions.stateGo 'authenticated.event'
# 			, { id: notification.additionalData.eventId }
# 			, { type: "flip", direction: "left", duration: 400 }
# 			, { reload: true }

# 		notify: (notification) ->
			
# 			$notification.show notification,
# 				templateUrl: 'notification.event.html'

# 				timeout: (notification, elem) =>
# 					elem.release()

# 				click: (notification, elem) =>
# 					elem.release()

# 					$ionicNativeTransitions.stateGo 'authenticated.event'
# 					, { id: notification.additionalData.eventId }
# 					, { type: "slide", direction: "down", duration: 400 }
# 					, { reload: true }

# 	.type 'general',
# 		# state:
# 			# name: 'authenticated.event'
# 			# paramsLink: id: 'eventId'
		
# 		deep: (notification) ->

# 			@notify notification
# 			# $ionicNativeTransitions.stateGo 'authenticated.event'
# 			# , { id: notification.additionalData.eventId }
# 			# , { type: "flip", direction: "left", duration: 400 }
# 			# , { reload: true }

# 		notify: (notification) ->
			
			
# 			popoverScope = undefined
# 			popoverScope = $rootScope.$new()
# 			popoverScope.notification = notification.additionalData.data.notification
# 			popoverScope.api = __API_URL__
# 			$ionicPopover.fromTemplateUrl 'notification.view.html',
# 				scope: popoverScope

# 			.then (popover) ->
# 				console.log 'POPOVER : ', popover
				
# 				popover.scope.popover = popover

# 				# popover.scope.notification =
# 				# 	value: 0
# 				# 	comment: ''
# 				popover.scope.popover.show()

# 				popover.scope.view = (notification) ->
					
# 					ionic.requestAnimationFrame ->
# 						console.log popover.el
# 						popover.el.style.transition = 'all .3s ease'
# 						popover.el.style.backgroundColor = 'rgba(0, 0, 0, 0)'
# 						popover.el.querySelector '#notification'
# 						.classList.add 'leave'
						
# 						setTimeout ->
# 							popover.scope.popover.hide()
# 						, 800

# 			# $notification.show notification,
# 			# 	templateUrl: 'notification.event.html'

# 			# 	timeout: (notification, elem) =>
# 			# 		elem.release()

# 			# 	click: (notification, elem) =>
# 			# 		elem.release()

# 			# 		$ionicNativeTransitions.stateGo 'authenticated.event'
# 			# 		, { id: notification.additionalData.eventId }
# 			# 		, { type: "slide", direction: "down", duration: 400 }
# 			# 		, { reload: true }

# 	console.log '------------------------------'
# 	console.log 'NOTIFICATION WATCH'
# 	console.log '------------------------------'
	
# 	$notification.watch()



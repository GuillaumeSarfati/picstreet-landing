# angular.module 'picstreet'

# .service '$room', (Room, Message, $rootScope, $socket, $state, $stateParams) ->

# 	$room = 
# 		create: (room, callback) ->

# 			Room.create room
# 			.$promise
# 			.then (room) ->
# 				console.log 'CREATE ROOM AND INJECT IN ROOTSCOPE'
# 				$room.watch room

# 				$rootScope.me.rooms.push room
# 				# $rootScope.$apply()
				
# 				callback room

# 		watch: (room) ->
# 			console.log '* ---- *'
# 			console.log '* --------------- *'
# 			console.log '* ------------------------ *'
# 			console.log "WATCH #{room.name} :", room
# 			console.log '* ------------------------ *'
# 			console.log '* --------------- *'
# 			console.log '* ---- *'
			
# 			$socket.on "concierge:message:#{room.id}", (message) ->
				
				
# 				if $state.current.name is 'authenticated.room' and $stateParams.id is room.id
# 					$room.broadcastReceiveConciergeMessage room, message
# 					Message.read message
# 				else
# 					room.messages.push message
# 					$room.checkMessageStatus()


# 			$socket.on "concierge:writing:#{room.id}", ->
# 				console.log 'receive concierge writing : room : ', room.name
				
# 				if $state.current.name is 'authenticated.room' and $stateParams.id is room.id
# 					$room.broadcastReceiveConciergeWriting room


# 			room
# 		getBadgeNumber: ->
			
# 			if $rootScope.me.general
# 				badgeNumber = if $rootScope.me.general.unreadMessageCounter then 1 else 0
# 			else
# 				badgeNumber = 0

# 			for room in $rootScope.me.rooms
# 				badgeNumber++ if room.unreadMessageCounter

# 			badgeNumber
		
# 		broadcastReceiveConciergeWriting: (room) ->
# 			$rootScope.$broadcast "concierge:writing:#{room.id}", {}
		
# 		broadcastReceiveConciergeMessage: (room, message) ->
# 			$rootScope.$broadcast "concierge:message:#{room.id}", message
		
# 		rattachNewMessagesToRoom: (scopeNewMessages, room) ->
# 			newMessages = angular.copy scopeNewMessages
			
# 			scopeNewMessages = []
			
# 			room.messages = [] unless room.messages
# 			for newMessage in newMessages
# 				room.messages.push newMessage

# 		checkMessageStatus: ->

# 			$rootScope.me.rooms = $rootScope.me.rooms.filter (room) ->
# 				if room.messages
# 					if room.messages.length > 0
# 						return true
# 					else false
# 				else
# 					room.messages = []
# 					return false

# 			$rootScope.me.rooms = $rootScope.me.rooms.map (room) ->
# 				lastReadMessagePosition = 0
				
# 				room.lastMessage = room.messages[room.messages.length - 1]
# 				room.latest = moment(room.lastMessage.date)
				
# 				room.messages.map (message, index) ->
# 					lastReadMessagePosition = index if message.status is 'read'
# 					message
				
# 				room.unreadMessageCounter = room.messages.length - lastReadMessagePosition - 1
				
				
# 				room

# 			$rootScope.me.rooms = $rootScope.me.rooms.sort (room1, room2) ->
# 				return -1 if room1.latest > room2.latest
# 				return 1 if room1.latest < room2.latest
# 				return 0	
			
# 			if $rootScope.me.general
# 				console.log '------------------------'
# 				console.log 'GENERAL ROOM ', $rootScope.me.general
# 				console.log '------------------------'
				
# 				$rootScope.me.general.lastMessage = $rootScope.me.general.messages[$rootScope.me.general.messages.length - 1]
# 				$rootScope.me.general.latest = moment($rootScope.me.general.lastMessage.date)
				
# 				lastReadMessagePosition = 0


# 				$rootScope.me.general.messages.map (message, index) ->
# 						lastReadMessagePosition = index if message.status is 'read'
# 						message
				
# 				$rootScope.me.general.unreadMessageCounter = $rootScope.me.general.messages.length - lastReadMessagePosition - 1


# 			$rootScope.unreadRoomBadgeNumber = $room.getBadgeNumber()
# 			# $rootScope.$apply()


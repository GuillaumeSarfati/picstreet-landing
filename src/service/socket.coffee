angular.module 'picstreet'


.factory '$socket', ($rootScope, LoopBackAuth) ->

	service = 

		instance: (url=__API_URL__) ->

			id = LoopBackAuth.accessTokenId
			userId = LoopBackAuth.currentUserId

			# console.log 'SOCKET INIT'
			# console.log '------------------------------------'
			# console.log 'LoopBackAuth.accessTokenId', id
			# console.log 'LoopBackAuth.currentUserId', userId
			# console.log '------------------------------------'
			
			socket = io.connect url
			

			socket.on 'photographer:position:update', (data) ->
				$rootScope.$emit 'photographer:position:update', data

			return socket

	return service

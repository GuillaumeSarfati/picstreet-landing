angular.module 'picstreet'

.service '$connect', (LoopBackAuth, Customer, $ionicNativeTransitions) ->
		
	$connect = 

		signup: (me, opts={}, callback) ->

			Customer.create me
			.$promise
			.then callback
			.catch (err) -> console.log 'err : ', err

		login: (opts={}, callback=->) ->

			Customer.login

				email: opts.email
				password: opts.password
				rememberMe: true

			.$promise
			.then (accessToken) ->
				unless accessToken.error
					
					LoopBackAuth.setUser(accessToken.id, accessToken.userId, accessToken.user)
					LoopBackAuth.rememberMe = true
					LoopBackAuth.save()

					callback accessToken
				
				else
					callback false

			.catch (err) -> callback false


		logout: (callback)->
			Intercom 'shutdown'
			Customer.logout()
			callback()

		remember: (callback=->) ->
			
			if window.localStorage.getItem '$LoopBack$accessTokenId'
				
				console.log '$connect:localStorage'
				
				Customer.getCurrent {}
				.$promise
				.then (me) ->
					Intercom "update",
					  name: "#{me.firstname} #{me.lastname}"
					  email: me.email
					  created_at: me.registrationDate
					callback me
				.catch (err) -> callback false
			else
				callback false
				


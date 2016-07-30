angular.module 'picstreet'

.service '$pxModal', ($rootScope, $ionicModal, $controller) ->
	
	$pxModal = 

		getPhotographerForm: (bindScope={}, callback=->) ->

			$pxModal.getModal 

				name: 'PhotographerForm'
				templateUrl: 'photographer-form.view.html'
				bindScope: bindScope

			, callback

		getModal: (opts, callback=->) ->

			if opts.templateUrl is undefined
				return callback new Error "opts.templateUrl is undefined"

			modalScope = $rootScope.$new()

			if Object.keys(opts.bindScope).length
				for propertyName, propertyValue of opts.bindScope
					modalScope[propertyName] = propertyValue

			if opts.controller
				$controller opts.controller, 
					$scope: modalScope

			$ionicModal.fromTemplateUrl opts.templateUrl,
				scope: modalScope
				animation: opts.animation||'slide-in-up'
			.then (modal) ->

				modalScope.modal = modal

				modalScope.show = ->
					modal.show()
					console.log  "$bb:modal:#{opts.name||'x'}:show"

				modalScope.hide = (state=undefined) ->
					modal.hide()
					console.log  "$bb:modal:#{opts.name||'x'}:hide"

				callback modal, modalScope
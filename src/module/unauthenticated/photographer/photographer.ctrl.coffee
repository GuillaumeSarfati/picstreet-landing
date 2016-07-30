angular.module "picstreet.photographer"

.controller "photographerCtrl", ($scope, $picstreet, $pxModal, photographers, monuments)->

	console.info '[ PHOTOGRAPHERS ]', photographers
	console.info '[ MONUMENTS ]', monuments
	
	$scope.getPhotographerForm = ->
		$pxModal.getPhotographerForm {}, (modal, modalScope) ->
			modal.show()

	$picstreet.init 'pk.eyJ1IjoicGl4ZXI0MiIsImEiOiJjaW91cDRqaGUwMDQ5dnRramp6cGkwMWh0In0.OpoxVVl38hLmP9XG2lk26w'
	
	$picstreet.map = $picstreet.createMap
		center: 
			lat: 48.8534100
			lng: 2.3488000
		zoom: 11
		# interactive: false

	$picstreet.createMonuments monuments


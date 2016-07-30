angular.module "picstreet.photographer", []

.config ($stateProvider) ->

	$stateProvider

	.state 'photographer',
		url: '/'
		templateUrl: 'photographer.view.html'
		controller: 'photographerCtrl'

		resolve: 

			photographers: (Photographer) ->
				Photographer.find
					filter:
						include: 
							relation: 'positions'
							scope:
								order: 'date DESC'
				.$promise

			monuments: (Location) ->
				Location.find {}
				.$promise
			
.run ->
	return

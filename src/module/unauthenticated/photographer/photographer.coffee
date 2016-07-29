angular.module "picstreet.photographer", []

.config ($stateProvider) ->

	$stateProvider

	.state 'photographer',
		url: '/'
		templateUrl: 'photographer.view.html'
		controller: 'photographerCtrl'

.run ->
	return

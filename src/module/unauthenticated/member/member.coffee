angular.module "picstreet.member", []

.config ($stateProvider) ->

	$stateProvider

	.state 'member',
		url: '/member'
		templateUrl: 'member.view.html'
		controller: 'memberCtrl'

.run ->
	return

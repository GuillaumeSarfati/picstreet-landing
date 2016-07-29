angular.module "picstreet.photographer"

.controller "photographerCtrl", ($rootScope, $scope, $state, $connect, Photographer, Location)->

	$scope.steps = [
		{number: 1, description: "Vous êtes en vacance ?"}
		{number: 2, description: "Rejoignez un de nos photographes !"}
		{number: 3, description: "Faites immortaliser vos plus beaux moments !"}
		{number: 4, description: "Vous recevez vos photos dans l'application !"}
		{number: 4, description: "Payez seulement pour ce que vous aimez !"}
	]
	
	photographers = {}
	$scope.photographersNumber = switch moment().hour()
		when 0 then 0
		when 1 then 0
		when 2 then 0
		when 3 then 0
		when 4 then 0
		when 5 then 0
		when 6 then 0
		when 7 then 0
		when 8 then 10
		when 9 then 22
		when 10 then 27
		when 11 then 41
		when 12 then 79
		when 13 then 83
		when 14 then 112
		when 15 then 134
		when 16 then 135
		when 17 then 141
		when 18 then 67
		when 19 then 12
		when 21 then 10
		when 22 then 2
		when 23 then 0
		
	L.mapbox.accessToken = 'pk.eyJ1IjoicGl4ZXI0MiIsImEiOiJjaW91cDRqaGUwMDQ5dnRramp6cGkwMWh0In0.OpoxVVl38hLmP9XG2lk26w';

	map = L.mapbox.map 'map'
	, 'mapbox.streets'
	, zoomControl: false
	.setView({
		lat: 48.858268766193774,
		lng: 2.294471561908722
	}, 16)


	Photographer.find
		filter:
			include: 
				relation: 'positions'
				scope:
					order: 'date DESC'
					limit: 1
	.$promise
	.then (photographers) -> 
		console.log '[ PHOTOGRAPHERS ]', photographers

		for photographer in photographers
			$scope.photographersNumber++
			photographerAddToMap photographer.id, photographer.positions[0]
			
		Location.find {}
		.$promise
		.then (locations) -> 

			for location in locations
				icon = L.divIcon
					className: 'marker-monument'
					html: """
						<div id="marker">
							<div id="item-reserve-free-shooting">
								<img src="#{__API_URL__}/api/Buckets/picstreet-location/download/#{location.picture}"/>
								<div>#{location.name}</div>
							</div>
							<div id="item-current-location-bar"><img src="img/svg/location-bar.svg"/></div>
							
						</div>
					"""
					iconSize: [94,200]
					iconAnchor: [47,190]

				L.marker [location.lat, location.lng], icon: icon
				.addTo map
			
			$scope.locations = locations
			console.log '[ LOCATIONS ]', locations
				


		.catch (err) -> console.log 'err : ', err

	.catch (err) -> console.log 'err _photographers : ', err

	photographerAssignPosition = (photographerId, position) ->
		if position.available
			icon = L.divIcon
				className: 'marker-photographer'
				html: """
					<div id="marker-photographer">
						<img src="img/svg/photographer.svg"/>
						<div id="item-current-location-bar"><img src="img/svg/photographe-bar.svg"/></div>
						<div id="item-current-location">
							<div class="sonar-location"><img src="img/svg/photographer-location.svg"/>
								<div class="sonar-wave">
							</div>
						</div>
					</div>
				"""
				iconSize: [70,90]
				iconAnchor: [35,85]
			
			photographer = 
				id: photographerId
				positions: [
					position
				]

			photographers[photographerId] = {}
			photographers[photographerId].icon = icon
			photographers[photographerId].photographer = photographer
			photographers[photographerId].marker = L.marker [photographer.positions[0].coord.lat, photographer.positions[0].coord.lng], icon: icon
			photographers[photographerId].marker.addTo map
		
		return

	photographerUpdatePosition = (photographerId, position) ->
		
		if position.available
			photographers[photographerId].photographer.positions[0] = position
			photographers[photographerId].marker.setLatLng position.coord
		
		else
			map.removeLayer photographers[photographerId].marker
			photographers[photographerId] = undefined
		
		return

	photographerIsAlreadyAvailable = (photographerId) ->
		return false unless photographers[photographerId]
		return false unless photographers[photographerId].photographer
		return false unless photographers[photographerId].photographer.positions[0]
		return false unless photographers[photographerId].photographer.positions[0].available
		return true

	photographerAddToMap = (photographerId, position) ->
		if photographerIsAlreadyAvailable photographerId
			photographerUpdatePosition photographerId, position
		
		else
			photographerAssignPosition photographerId, position
	
	$rootScope.$on 'photographer:position:update', (e, position) ->
		console.log 'receive photographer position update : ', position

 
		photographerAddToMap position.photographerId, position

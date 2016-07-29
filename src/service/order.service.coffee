# angular.module 'picstreet'

# .service '$order', ($rootScope) ->
# 	service = {}

# 	service.men = 0
# 	service.women = 0


# 	service.areas = [
# 		{ name: 'Dance floor', minSpend: 1000, logo: 'img/area/dancefloor.png', freePerson: 6, priceAddPerPerson: 150}
# 		{ name: 'Simple Table', minSpend: 2500, logo: 'img/area/simple-table.png', freePerson: 6, priceAddPerPerson: 250}
# 		{ name: 'Best Table', minSpend: 5000, logo: 'img/area/best-table.png', freePerson: 6, priceAddPerPerson: 350}
# 	]
# 	service.events = [
# 		{
# 			address: "12 rue quanquampoix Paris - 75002"
# 			nightclub: "Raspoutin"
# 			name: "Fashion Week"
# 			guest: 'Dj Toto'
# 			date: moment().hour(0).minute(0).second(0).millisecond(0).toDate()
# 			arrivalTime:
# 				min: moment().hour(23).minute(0).second(0).millisecond(0).toDate()
# 				max: moment().add(1, 'days').hour(4).minute(0).second(0).millisecond(0).toDate()
# 		},
# 		{
# 			address: "12 rue quanquampoix Paris - 75002"
# 			nightclub: "Raspoutin"
# 			name: "Fashion Week 2"
# 			guest: 'Dj Titi'
# 			date: moment().hour(0).minute(0).second(0).millisecond(0).toDate()
# 			arrivalTime:
# 				min: moment().hour(23).minute(0).second(0).millisecond(0).toDate()
# 				max: moment().add(1, 'days').hour(4).minute(0).second(0).millisecond(0).toDate()
# 		},

# 	]

# 	service.order = [
# 		[
# 			{ name: 'bottle1', quantity: 0, price: 10000}
# 			{ name: 'bottle2', quantity: 0, price: 10000}
# 			{ name: 'bottle3', quantity: 0, price: 10000}
# 			{ name: 'bottle4', quantity: 0, price: 10000}
# 			{ name: 'bottle5', quantity: 0, price: 10000}
# 			{ name: 'bottle6', quantity: 0, price: 25000}
# 			{ name: 'bottle7', quantity: 0, price: 100000}
# 			{ name: 'bottle8', quantity: 0, price: 1000000}
# 			{ name: 'bottle1', quantity: 0, price: 250}
# 			{ name: 'bottle2', quantity: 0, price: 500}
# 			{ name: 'bottle3', quantity: 0, price: 1000}
# 			{ name: 'bottle4', quantity: 0, price: 2500}
# 			{ name: 'bottle5', quantity: 0, price: 10000}
# 			{ name: 'bottle6', quantity: 0, price: 25000}
# 			{ name: 'bottle7', quantity: 0, price: 100000}
# 			{ name: 'bottle8', quantity: 0, price: 1000000}
# 		],
# 		[
# 			{ name: 'Gateau d anniversaire', quantity: 0, price: 250, src: 'http://i.bnet.com/blogs/new_york_city_taxi_cab_yellow_blur.jpg'}
# 			{ name: 'Chauffeur', quantity: 0, price: 250, src: 'http://i.bnet.com/blogs/new_york_city_taxi_cab_yellow_blur.jpg'}
# 			{ name: 'Bonbon', quantity: 0, price: 250, src: 'http://i.bnet.com/blogs/new_york_city_taxi_cab_yellow_blur.jpg'}
# 			{ name: 'Bonbon', quantity: 0, price: 250, src: 'http://i.bnet.com/blogs/new_york_city_taxi_cab_yellow_blur.jpg'}
# 		],
# 		[
# 			{ name: 'Yatch', quantity: 0, price: 10000, src: 'http://i.bnet.com/blogs/new_york_city_taxi_cab_yellow_blur.jpg'}
# 			{ name: 'Voiture', quantity: 0, price: 5000, src: 'http://i.bnet.com/blogs/new_york_city_taxi_cab_yellow_blur.jpg'}
# 			{ name: 'Demeure', quantity: 0, price: 5000, src: 'http://i.bnet.com/blogs/new_york_city_taxi_cab_yellow_blur.jpg'}
# 			{ name: 'Jet Privée', quantity: 0, price: 15000, src: 'http://i.bnet.com/blogs/new_york_city_taxi_cab_yellow_blur.jpg'}
# 		]
# 	]

# 	service.forecast = service.areas[0].minSpend
# 	service.budget = 0
# 	service.depositPercent = 10
# 	service.currentArea = service.areas[0]
# 	service.currentEvent = service.events[0]
# 	service.total = 0

# 	service.addProduct = (productName) ->
# 		total = 0
# 		for categorie in service.order
# 			for product in categorie
# 				console.log product.name
# 				if product.name is productName
# 					product.quantity++
# 				total += product.quantity * product.price
# 		service.total = total


# 	service.subtractProduct = (productName) ->
# 		total = 0
# 		for categorie in service.order
# 			for product in categorie
# 				if product.name is productName
# 					product.quantity--
# 				total += product.quantity * product.price
# 		service.total = total


# 	return $rootScope.order = service

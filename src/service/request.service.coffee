# angular.module 'picstreet'

# .service '$request', ($filter) ->

# 	$request = 

# 		eval: (request) ->

# 			input = ///<([A-z:]+)>///g
# 			# currency = ///(<\$>){1}///g
# 			br = ///<br/>///g
# 			# more = ///\.\.\.///g

# 			evaluedText = request.template

# 			.replace input, (match, info) ->

# 				type = info.split(':')[0]
# 				bind = info.split(':')[1]

# 				if type is 'date'
# 					return """
# 					#{$filter('date')(request.params[bind], 'ddd DD MMMM YYYY')}
# 				"""
				
# 				if type is 'number'
# 					return """
# 						#{request.params[bind]+$filter('currency')('')+' '}
# 					"""
				
# 				if type is 'text'
# 					return """
# 					#{ if request.params[bind] then request.params[bind] else '' }
# 				"""


# 				return """
# 					#{request.params[bind]}
# 				"""
# 			# .replace currency, ->

# 			# 	return """
# 			# 		#{$filter('currency')('')}
# 			# 	"""

# 			.replace br, -> ''
# 			# .replace more, -> ''

# 			console.log '---------------------------'
# 			console.log 'EVALUED TEXT : ', evaluedText
# 			console.log '---------------------------'

# 			return evaluedText

# 		parse: (request) ->

# 			input = ///<([A-z:]+)>///g
# 			currency = ///(<\$>){1}///
# 			word = ///[\s]*([A-z0-9-]+)[\s|.|,]///g

# 			replacedText = request.template

# 			.replace word, (match, word) ->
# 				console.log 'WORD : ', match, word
# 				return """
# 					<bb-word>#{match}</bb-word>
# 				"""

# 			.replace input, (match, info) ->

# 				type = info.split(':')[0]
# 				bind = info.split(':')[1]

# 				switch type
					
# 					when 'select' 
# 						return """
# 							<bb-input-choice choice="request.params.#{bind}" choices="request.values.#{bind}"></bb-input-choice>
# 						"""
# 						# """
# 						# 	<select ng-model="request.params.#{bind}">
# 						# 		<option ng-repeat="x in request.values.#{bind} track by $index" ng-value="x">{{x}}</option>
# 						# 	</select>
# 						# """

# 					when 'hour' 
# 						return """
# 							<bb-input-hour hour="request.params.#{bind}" hours="request.values.#{bind}"></bb-input-hour>
# 						"""

# 						# """
# 						# 	<i class="ion-ios-clock-outline"></i><select ng-model="request.params.#{bind}">
# 						# 		<option ng-repeat="x in request.values.#{bind} track by $index" ng-value="x">{{x}}</option>
# 						# 	</select>
# 						# """

# 					when 'location' 
# 						return """
# 							<bb-input-location location="request.params.#{bind}" locations="request.values.#{bind}"></bb-input-location>
# 						"""
# 						# """
# 						# 	<i class="ion-ios-location-outline"></i><select ng-model="request.params.#{bind}">
# 						# 		<option ng-repeat="x in request.values.#{bind} track by $index" ng-value="x">{{x}}</option>
# 						# 		<option ng-value="'another city'">another city</option>
# 						# 	</select>
# 						# """

# 					when 'date'
# 						return """
# 							<bb-input-date date="request.params.#{bind}"></bb-input-date>
# 						"""

# 					when 'number'
# 						return """
# 							<bb-input-spend spend="request.params.#{bind}"></bb-input-spend>
# 						"""
# 						# """
# 						# 	<input class="input-#{type}" type="#{type}" ng-model="request.params.#{bind}">
# 						# """



# 					when 'text'
# 						return """
# 							<bb-input-more more="request.params.#{bind}"></bb-input-more>
# 						"""
# 						# """
# 						# 	<span
# 						# 	contenteditable="true"
# 						# 	ng-model="request.params.#{bind}"
# 						# 	ng-focus="focus('#{bind}')"
# 						# 	ng-blur="blur('#{bind}')">
# 						# 	...
# 						# 	</span>
# 						# """
# 			.replace currency, ->

# 				return ""
# 				# """
# 				# 	{{ '' | currency }}
# 				# """
# 			console.log '---------------------------'
# 			console.log 'REPLACED TEXT : ', replacedText
# 			console.log '---------------------------'

# 			return replacedText

# 			# console.log 'INPUT : ', text.match input
# 			# console.log 'CURRENCY : ', text.match currency
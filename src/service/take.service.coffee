# angular.module 'picstreet'

# .service '$take', ($cordovaActionSheet, $cordovaCamera, $cordovaFileTransfer) ->
# 	generatePictureName = (length=20)->
#     text = ""
#     possible = "abcdefghijklmnopqrstuvwxyz0123456789"

#     for i in [0..length]
#         text += possible.charAt(Math.floor(Math.random() * possible.length));

#     text + '.jpg'

# 	$take = 
# 		picture : (bucket, callback) ->

# 			$cordovaActionSheet.show
# 				title: 'Bottle Booking',
# 				buttonLabels: ['Take Photo', 'Photo from library'],
# 				addCancelButtonWithLabel: 'Cancel',
# 				androidEnableCancelButton : true,
			
# 			.then (response) ->

# 				from = undefined

# 				OPEN_CAMERA = 1
# 				OPEN_LIBRARY = 2

# 				if response is OPEN_CAMERA

# 					from = Camera.PictureSourceType.CAMERA

# 				if response is OPEN_LIBRARY

# 					from = Camera.PictureSourceType.PHOTOLIBRARY
				
# 				if response in [OPEN_LIBRARY, OPEN_CAMERA]

# 					$cordovaCamera.getPicture
						
# 						sourceType: from
# 						quality: 5
# 						targetWidth: 300

# 					.then (localPicture) ->
						
# 						console.log 'LOCAL PICTURE : ', localPicture
# 						callback localPicture, (successUploadedCallback) ->

# 							localFilename = localPicture.match(/// .+/(.+.[jpeg|jpg])$///)[1]
# 							uploadFilename = generatePictureName()

# 							console.log 'LOCAL FILENAME 1 : ', localFilename

# 							fileurl = '/api/Containers/' + bucket + '/download/' + uploadFilename
							
# 							filepath = window.cordova.file.dataDirectory
							
# 							uploadUrl = __API_URL__ + '/api/Containers/' + bucket + '/upload'
							
# 							console.log '------------------------------------'
# 							console.log 'UPLOAD URL : ', uploadUrl
# 							console.log 'LOCAL PICTURE : ', localPicture
# 							console.log 'LOCAL FILENAME : ', localFilename
# 							console.log '------------------------------------'

# 							$cordovaFileTransfer.upload uploadUrl, localPicture, {fileName: uploadFilename}

# 							.then (success) ->

# 								console.log 'success upload'
# 								successUploadedCallback fileurl
# 								# img = new Image()
# 								# img.src = fileurl
# 							.catch (err) ->
# 								console.log 'PICTURE ERR : ', err





# 	# 	if window.cordova
				
# 		# 		navigator.camera.getPicture (localPicture) ->
					
# 		# 			console.log 'localPicture : ', localPicture
# 		# 			console.log localFilename = localPicture.match /// .+/(.+.[jpeg|jpg])$///


# 		# 			fileurl = __API_URL__ + '/api/Containers/' + bucket + '/download/' + localFilename[1]
# 		# 			filename = fileurl.replace ///[^\w]///g, 'x'
# 		# 			filepath = window.cordova.file.dataDirectory
# 		# 			$cordovaFileTransfer.upload __API_URL__ + '/api/Containers/' + bucket + '/upload', localPicture, {fileName: filename}
					
# 		# 			.then (success) ->

# 		# 				position = undefined
# 		# 				message = 
# 		# 					data:
# 		# 						picture: fileurl
# 		# 						type: 'picture'
# 		# 					date: new Date()
# 		# 					ownerId: $rootScope.me.id
# 		# 					roomId: $scope.room.id

# 		# 				Message.create message
# 		# 				.$promise
						
# 		# 				.then (success) ->
# 		# 					$scope.skip++
# 		# 					$scope.newMessages[position].status = 'receveid'
# 		# 				.catch (err) -> $scope.room.messages[position].status = 'error'


# 		# 				$scope.newMessages.push message
# 		# 				position = $scope.newMessages.length - 1

# 		# 				img = new Image()
# 		# 				img.onload = ->
# 		# 					$ionicScrollDelegate.$getByHandle('chat').scrollBottom true

# 		# 				img.src = fileurl

# 		# 			.catch (err) ->
# 		# 				console.log 'Error try again later or check your internet connectivity'
				
# 		# 		, (err) ->
# 		# 			console.log 'Error try again later or check your internet connectivity'
# 		# 		, {
# 		# 			encodingType: Camera.EncodingType.JPEG,
# 		# 			targetWidth: 640,
# 		# 			targetHeight: 1132,
# 		# 			quality: 100,
# 		# 		}

# 		# 	else

# 		# 		localPicture = "file:///var/mobile/Containers/Data/Application/E6378DA6-0B20-4CB6-8946-CF2E13ADCE19/tmp/cdv_photo_001.jpg"
# 		# 		console.log filename = localPicture.match /// .+/(.+.[jpeg|jpg])$///





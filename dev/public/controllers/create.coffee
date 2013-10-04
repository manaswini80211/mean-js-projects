CreateController = angular.module('mean.project')
.controller 'CreateController', ($scope, $location, Project)->
	$scope.save = ->
		Project.save $scope.project, (project)->
			$location.path '/edit/' + project._id.$old
	no
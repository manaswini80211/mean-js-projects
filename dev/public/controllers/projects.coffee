ProjectsController = angular.module('mean.project')
.controller 'ProjectsController', ($scope, $routeParams, $location, Projects, Global)->
	$scope.global = Global
	$scope.projects = Projects.query()

	$scope.edit = ()->
		Projects.get
			projectId: $routeParams.projectId
		, (project)=>
			@original = project
			$scope.project = new Projects(@original)

	$scope.create = ()->
		Projects.save $scope.project, ()->
			$location.path 'projects/'

	$scope.isClean = ()->
		angular.equals @original, $scope.project

	$scope.remove = ()->
		@original.$remove ()->
			$location.path 'projects/'

	$scope.save = ()->
		$scope.project.$update ()->
			$location.path 'projects/'

	$scope.cancel = ()->
		$location.path 'projects/'
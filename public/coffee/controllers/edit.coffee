EditController = angular.module('mean.project')
.controller 'EditController', ($scope, $location, $routeParams, Project)=>
	Project.get { id: $routeParams.projectId }, (project)=>
		@original = project
		$scope.project = new Project(@original)

	$scope.isClean = ()=>
		angular.equals @original, $scope.project

	$scope.destroy = ()=>
		@original.destroy ()->
			$location.path '/list'

	$scope.save = ()=>
		$scope.project.update ()->
			$location.path '/'
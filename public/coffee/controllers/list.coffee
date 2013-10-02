ListController = angular.module('project').controller 'ListController', ($scope, Project)->
	$scope.projects = Project.query()
	no
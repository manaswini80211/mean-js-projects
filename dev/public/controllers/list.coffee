ListController = angular.module('mean.project')
.controller 'ListController', ($scope, Project)->
	$scope.projects = Project.query()
	no
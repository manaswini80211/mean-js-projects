var ListController = angular.module('project').controller('ListController',
	function ($scope, Project) {
		$scope.projects = Project.query();
	}
);
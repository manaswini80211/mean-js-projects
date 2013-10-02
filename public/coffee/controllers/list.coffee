# var ListController = angular.module('project').controller('ListController',
# 	function ($scope, Project) {
# 		$scope.projects = Project.query();
# 	}
# );

ListController = angular.module('project').controller(
	'ListController'
	($scope, Project)->
		$scope.projects = Project.query()
)
HeaderController = angular.module('mean.system')
.controller 'HeaderController', ($scope, Global)->
	$scope.global = Global

	$scope.menu = [
		"title": "Projects"
		"link": "projects"
	,
		"title": "Components"
		"link": "components"
	,
		"title": "Todo"
		"link": "todo"
	]
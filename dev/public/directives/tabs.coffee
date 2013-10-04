angular.module('mean.components')
.directive 'tabs', ()->
	restrict: 'E'
	transclude: yes
	scope: {}
	controller: ($scope, $element)->
		panes = $scope.panes = []

		$scope.select = (pane)->
			angular.forEach panes, (pane)->
				pane.selected = no
			pane.selected = yes
			no

		@addPane = (pane)->
			$scope.select pane if panes.length is 0
			panes.push pane
			no

	template: '<div class="tabbable">' +
	'<ul class="nav nav-tabs">' +
	'<li ng-repeat="pane in panes" ng-class="{active:pane.selected}">' +
	'<a href="" ng-click="select(pane)">{{pane.title}}</a>' +
	' </li>' +
	'</ul>' +
	'<div class="tab-content" ng-transclude></div>' +
	'</div>'
	replace: yes

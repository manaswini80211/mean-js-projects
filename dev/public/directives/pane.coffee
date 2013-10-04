angular.module('mean.components')
.directive 'pane', ()->
	require: '^tabs'
	restrict: 'E'
	transclude: yes
	scope:
		title: '@'
	link: (scope, element, attr, tabsCtrl)->
		tabsCtrl.addPane scope
		no
	template: '<div class="tab-pane" ng-class="{active: selected}" ng-transclude></div>'
	replace: yes
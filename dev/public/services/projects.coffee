angular.module('mean.project')
.factory 'Projects', ($resource)->
	$resource(
		'projects/:projectId'
	,
		projectId: '@_id'
	,
		update:
			method: 'PUT'
	)
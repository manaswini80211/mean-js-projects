angular.module('mean.system')
.factory 'Global', ()=>
	@_data =
		user: window.user
		authentificated: !! window.user
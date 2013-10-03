window.app = angular.module 'mean', ['ngCookies', 'ngResource', 'ui.bootstrap', 'ui.route', 'mongolab', 'mean.system', 'mean.project', 'mean.components']

angular.module 'mean.system', []
angular.module 'mean.project', []
angular.module 'mean.components', []
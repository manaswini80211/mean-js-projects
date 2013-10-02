//Setting up route
window.app.config(['$routeProvider', function($routeProvider) {
    $routeProvider.
        when('/', {
            controller: 'ListController',
            templateUrl: 'views/list.html'
        }).
        when('/edit/:projectId', {
            controller: 'EditController',
            templateUrl: 'views/detail.html'
        }).
        when('/new', {
            controller: 'CreateController',
            templateUrl: 'views/detail.html'
        }).
        otherwise({
            redirectTo: '/'
        });
    }
]);

//Setting HTML5 Location Mode
window.app.config(['$locationProvider',
    function($locationProvider) {
        $locationProvider.hashPrefix("!");
    }]);
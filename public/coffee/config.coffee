# Setting up route
window.app.config [
    '$routeProvider'
    ($routeProvider)->
        $routeProvider
        .when '/',
            controller: 'ListController'
            templateUrl: 'views/list.html'
        .when '/edit/:projectId',
            controller: 'EditController'
            templateUrl: 'views/detail.html'
        .when '/new',
            controller: 'CreateController'
            templateUrl: 'views/detail.html'
        .when '/components',
            controller: 'BearCounterController'
            templateUrl: 'views/components.html'
        .otherwise
            redirectTo: '/'
        no
]

# Setting HTML5 Location Mode
window.app.config [
    '$locationProvider'
    ($locationProvider)->
        $locationProvider.hashPrefix "!"
]
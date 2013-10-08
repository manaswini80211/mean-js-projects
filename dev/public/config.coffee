# Setting up route
window.app.config [
    '$routeProvider'
    ($routeProvider)->
        $routeProvider
        .when '/projects',
            controller: 'ProjectsController'
            templateUrl: 'views/projects/list.html'
        .when '/projects/:projectId/edit',
            controller: 'ProjectsController'
            templateUrl: 'views/projects/edit.html'
        .when '/projects/new',
            controller: 'ProjectsController'
            templateUrl: 'views/projects/create.html'
        .when '/components',
            controller: 'BeerCounterController'
            templateUrl: 'views/components.html'
        .when '/todo',
            controller: 'TodoController'
            templateUrl: 'views/todo.html'
        .when '/',
            controller: 'IndexController'
            templateUrl: 'views/index.html'
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
TodoController = angular.module('mean.todo')
.controller 'TodoController', ($scope)->
	$scope.todos = [
		text: 'learn angular'
		done: yes
	,
		text: 'build an angular app'
		done: no
	]

	$scope.addTodo = ->
		$scope.todos.push
			text: $scope.todoText
			done: no
		$scope.todoText = ''

	$scope.remaining = ->
		count = 0
		angular.forEach $scope.todos, (todo)->
			count += 1 if todo.done
		count

	$scope.archive = ->
		oldTodos = $scope.todos
		$scope.todos = []
		angular.forEach oldTodos, (todo)->
			if not todo.done then $scope.todos.push todo
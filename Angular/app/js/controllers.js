'use strict';

myApp.controller('View1Ctrl', ['$scope',
    function ($scope) {

    	$scope.tasks = [
    	{detail: "wipe your ass"},
    	{detail: "hug Unai"},
    	{detail: "charge your phone"}
    	];

    	$scope.priority = 'normal';

    	$scope.addTask = function() {
    		if(event.keyCode == 13 && $scope.taskDetails) {
    			$scope.tasks.push({detail: $scope.taskDetails, "completed": false, "priority": $scope.priority});
    			$scope.taskDetails = "";
    			$scope.priority = 'normal';
    		};
    	};

    	$scope.deleteTask = function() {
    		
    	};
  }]);

// myApp.controller('View2Ctrl', ['$scope',
//     function ($scope) {

// 	$scope.things = [
// 	{name: 'unai', age: 23},
// 	{name: 'maegan', age: 26},
// 	{name: 'will', age: 22},
// 	];

//   }]);


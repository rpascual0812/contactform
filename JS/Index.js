var indexApp = angular.module("onload", ['ngRoute','ui.bootstrap']);

indexApp.config(function($routeProvider){
    $routeProvider
        .when('/',
            {
                controller: 'ContactsController',
                templateUrl: './Partials/Contacts/form.html'
            })
        .otherwise({ redirectTo: '/' }
    );
});


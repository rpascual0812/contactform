indexApp.controller('ContactsController', 
                    function($scope,
                            $window,
                            $timeout,
                            ContactsFactory
                            ){

    $scope.contacts = {};
    $scope.alert = {};
    init();
    
    var timer;

    function init(){
        clearform();
        clearalert();

        $scope.alert.diverror = false;

        fetch();
    }

    function fetch(){
    	var promise = ContactsFactory.fetch();
        promise.then(function(data){ 
            $scope.contacts.list = data.data.data;
        })
    }

    $scope.submitform = function(){
        var promise = ContactsFactory.create($scope.contacts.newform);
        promise.then(function(data){
            if($scope.contacts.list){
                $scope.contacts.list.unshift($scope.contacts.newform);    
            }
            else{
                $scope.contacts.list = [];
                $scope.contacts.list.unshift($scope.contacts.newform);
            }
            
            clearalert();
            clearform();

            $scope.alert.diverror = true;
            $scope.alert.message = 'Contact saved.';
            $scope.alert.errorclass = 'div-success';

            $timeout.cancel(timer);
            timer = $timeout(removeAlert, 5000);
        })
        .then(null, function(data){
            var info = data.data;
            if(info.msg == 'incomplete'){
                for (var key in $scope.contacts.newform) {
                    if($scope.contacts.newform[key] && $scope.contacts.newform[key].replace(/\s/g,'') != ""){
                        //skip
                    }
                    else{
                        $scope.alert[key] = true;
                    }
                }

                $scope.alert.diverror = true;
                $scope.alert.message = 'Required fields cannot be left empty';
                $scope.alert.errorclass = 'div-error';

                $timeout.cancel(timer);
                timer = $timeout(removeAlert, 5000);
            }
        })
    }

    function removeAlert(){
        //
        $scope.alert.diverror = false;
    }

    function clearform(){
        $scope.contacts.newform = {
            firstname : null,
            lastname : null,
            address : null,
            city : null,
            state : null,
            zip : null
        };
    }

    function clearalert(){
        $scope.alert = {
            firstname : false,
            lastname : false,
            address : false,
            city : false,
            state : false,
            zip : false
        };
    }

    function inputfocus(field){
        $scope.alert[field] = false;
    }
});
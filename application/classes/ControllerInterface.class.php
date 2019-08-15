<?php   

interface ControllerInterface {
    function httpGetMethod(Http $http, array $queryFields);

    
    function httpPostMethod(Http $http, array $formFields);
    
}



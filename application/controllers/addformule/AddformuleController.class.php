f<?php

class AddformuleController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
		$model = new FormuleModel(new Database());
        $formules = $model->findFormule();
        // var_dump($formules);
        // die;

        return [
            'formules' => $formules,
            ];
    }

    public function httpPostMethod(Http $http, array $formFields)
    {
    	/*
    	 * Méthode appelée en cas de requête HTTP POST
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $formFields contient l'équivalent de $_POST en PHP natif.
    	 */
    }
}

<?php

class MacommandeController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
		$model = new IngredientModel(new Database());

		$bases = $model->findByType('BASE');
		$proteines = $model->findByType('PROTEINE');
        $supplements = $model->findByType('SUPPLEMENT');
        $desserts = $model->findElement('dessert');
        $boissons = $model->findElement('boisson');

        return [
            'bases' => $bases,
            'proteines' => $proteines,
            'supplements' => $supplements,
            'desserts' => $desserts,
            'boissons' => $boissons];
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
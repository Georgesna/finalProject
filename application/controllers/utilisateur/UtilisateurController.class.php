<?php

class UtilisateurController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
    	/*
    	 * Méthode appelée en cas de requête HTTP GET
    	 *
    	 * L'argument $http est un objet permettant de faire des redirections etc.
    	 * L'argument $queryFields contient l'équivalent de $_GET en PHP natif.
    	 */
    }

    public function httpPostMethod(Http $http, array $formFields)
    {
		$model = new UtilisateurModel (new Database());
		$user = $model -> findUserByLogin ($formFields['login']);

			if (is_null($user['id'])) {
				$http->RedirectTo('/utilisateur');
			} else {
				if (password_verify($formFields['password'], $user['motDePasse'])) {
					$session = new UserSession();
					$session->create($user['id'], $user['firstName'], $user['lastName'], $user['mail'], $user['role']);
					if ($user['role']=='client') {
						$http->RedirectTo('/macommande');
					}
					else {
						$http->RedirectTo('/admin');
					}
				} else {
					$http->RedirectTo('/utilisateur');	
				}
			}
    }
}
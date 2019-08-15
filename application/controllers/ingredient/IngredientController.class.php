<?php

class IngredientController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
    	
    }

    public function httpPostMethod(Http $http, array $formFields)
    {
        $model = new IngredientModel(new Database());
        $modelMedia = new MediaModel(new Database());
        
        if ($_FILES["picture"]["error"] == UPLOAD_ERR_OK) {
            $tmp_name = $_FILES["picture"]["tmp_name"];
            // basename() peut empêcher les attaques "filesystem traversal";
            // une autre validation/néttoyage du nom de fichier peux être appropriée
            $name = basename($_FILES["picture"]["name"]);
            move_uploaded_file($tmp_name, ROOT_PATH."/application/www/images/illustrations/$name");
        }
        
        $idMedia = $modelMedia->addMedia($name, $_FILES["picture"]["type"]);

		$ingredient = $model->addIngredient($formFields['name'], $formFields['prix'], $formFields['type'], $idMedia);
    }
}
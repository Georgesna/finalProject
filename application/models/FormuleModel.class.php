<?php
final class FormuleModel {
    const QUERY_ALLFORMULE = "SELECT * FROM `formule` WHERE 1";

    private $db;

    function __construct (Database $database) {
        $this->db = $database;
    }

    public function findFormule(){
        $result = $this->db->query(self::QUERY_ALLFORMULE);
        return $result;
    }


    function addFormule (string $name, string $dessert, string $boisson) {
        $register =
        "INSERT INTO `formule`(`name`, `dessert`,`boisson`)  
        VALUES (:name, :dessert, :boisson)";
        $parameters['name']=$name;
        $parameters['dessert']=$dessert;
        $parameters['boisson']= $boisson;
        $key= $this->db->executeSql($register, $parameters);
        return $key;
    }

}



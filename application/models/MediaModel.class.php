<?php
final class MediaModel {
    private $db;

    function __construct (Database $database) {
        $this->db = $database;
    }

    function addMedia (string $name, string $type) {
        $register =
        "INSERT INTO `media`(`name`,`type`)  
        VALUES (:name,:type)";
        $parameters['name']=$name;
        $parameters['type']= $type;
        $key = $this->db->executeSql($register, $parameters);
        return $key;
    }
}
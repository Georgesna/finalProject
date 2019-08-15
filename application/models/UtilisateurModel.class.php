<?php 
final class UtilisateurModel {
    const UTILISATEUR = 
        "SELECT `id`, `login`,`motDePasse`,`firstName`,`lastName`,`mail`,`role`
         FROM `utilisateur` 
         WHERE `login` = :login";

    private $db;

    function __construct (Database $database) {
        $this->db = $database;
    }


    function findUserByLogin (string $login)
    {
        $parameters['login']= $login;
 
        $query= $this->db->queryOne(self::UTILISATEUR, $parameters);
        return $query;
    }


    function addUser (string $firstName, string $lastName, string $login, string $motDePasse, string $mail) {
        $register =
            "INSERT INTO `utilisateur`(`firstName`, `lastName`,`login`, `motDePasse`, `mail`)  
             VALUES (:firstName, :lastName, :login, :motDePasse,  :mail)";
        $parameters['firstName']=$firstName;
        $parameters['lastName']=$lastName;
        $parameters['login']= $login;
        $parameters['motDePasse']=password_hash($motDePasse, PASSWORD_DEFAULT);
        $parameters['mail']= $mail;
        $key= $this->db->executeSql($register, $parameters);
        return $key;
    }




}





?>
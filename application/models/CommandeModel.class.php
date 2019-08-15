<?php
class CommandeModel {
    // const QUERY_DISPLAYCOMMANDE = 'SELECT *
    // FROM commande
    // WHERE 1';
    // // const QUERY_DISPLAYSINGLECOMMANDE=' SELECT *
    // // FROM utilisateurs AS u
    // // INNER JOIN commande AS c
    // // ON b.auteur = u.id
    // // LEFT JOIN commentaires AS c
    // // ON b.id = c.lien
    // // WHERE b.id=?';
    // const QUERY_DISPATCHER = ' SELECT *
    // FROM commande AS c
    // inner join utilisateur AS u
    // on c.client_id = u.id;
    // WHERE u.role=livreur
    // AND u.statut=true';

    // protected $id;
    // protected $client_id;
    // protected $prix;
    // protected $dateDeCommande;
    // protected $statut;
    // public function findAll(PDO $dataBase){
    //     $query= $dataBase->prepare(QUERY_DISPLAYCOMMANDE);
    //     $error = $query->execute();
    //     $result = $query -> fetchAll();
    //     return $result;
    // }
    // // public function find(PDO $dataBase, int $id){
    // //     $query= $dataBase->prepare(QUERY_DISPLAYSINGLECOMMANDE);
    // //     $error = $query->execute([$id]);
    // //     $result = $query -> fetchAll();
    // //     return $result;
    // // }
    // public function findAll(PDO $dataBase){
    //     $query= $dataBase->prepare(QUERY_DISPATCHER);
    //     $error = $query->execute();
    //     $result = $query -> fetchAll();
    //     return $result;}}
}; ?>
<?php 
 class Conexion extends PDO { 

   private $tipo_de_base = 'mysql';       //todos los atributos privados
   private $host = 'localhost';
   private $nombre_de_base = 'CE';
   private $usuario = 'root'; 
   private $contrasena = '';

   public function __construct() { //modificando el construcctor de pdo (parent invoca al constructor padre)
      try{
         parent::__construct($this->tipo_de_base.':host='.$this->host.';dbname='.$this->nombre_de_base, $this->usuario, $this->contrasena);
      }catch(PDOException $e){
         //$errorDB= 'Ocurrio un error no nos pudimos conectar con la base de datos. Error: ' . $e->getMessage();
         throw new Exception();
         exit;
      }
   } 
 } 
?>

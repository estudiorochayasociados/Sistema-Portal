<?php

namespace Clases;

class Estados
{

//Atributos
    public $id;
    public $nombre;
    public $indice;
    private $con;

//Metodos
    public function __construct()
    {
        $this->con = new Conexion();
    }

    public function set($atributo, $valor)
    {
        $this->$atributo = $valor;
    }

    public function leer()
    {
        $sql = "SELECT * FROM estados WHERE indice = '".$this->indice."'";
        $estados = $this->con->sqlReturn($sql);
        $array = mysqli_fetch_assoc($estados);
        return $array;
    }

}

<?php namespace Clases;


class Clientes
{
    //Atributos
    public $id;
    public $manzana;
    public $lote;
    public $titulares;
    public $dni;
    public $telefono;
    public $domicilio;
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
        $sql = "SELECT * FROM clientes WHERE dni LIKE '%".$this->dni."%' GROUP BY dni";
        $cliente = $this->con->sqlReturn($sql);
        $array = mysqli_fetch_assoc($cliente);
        return $array;
    }

    public function asociarDatos()
    {
        $r = false;
        $sql = "SELECT * FROM `clientes` WHERE `dni` LIKE '%{$this->dni}%' GROUP BY dni";
        $cliente = $this->con->sqlReturn($sql);

        if ($cliente->num_rows > 0) {
            $array = mysqli_fetch_assoc($cliente);
            $r = $array;
        }

        return $r;
    }

    public function obtenerLotes()
    {
        $array = array();
        $r = false;
        $sql = "SELECT lote FROM `clientes` WHERE `dni` LIKE '%{$this->dni}%'";
        $cliente = $this->con->sqlReturn($sql);

        if ($cliente->num_rows > 0) {
            while($row = mysqli_fetch_assoc($cliente)){
                $array[] = $row;
            }
            $r = $array;
        }

        return $r;
    }
}
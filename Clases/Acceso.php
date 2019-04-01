<?php

namespace Clases;

class Acceso
{

//Atributos
    public $id;
    public $usuario;
    public $password;
    public $dni;
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

    public function accesoEscribanos()
    {
        $r = false;
        $sql = "SELECT * FROM `acceso` WHERE `usuario` = '{$this->usuario}' AND `password`= '{$this->password}'";
        $acceso = $this->con->sqlReturn($sql);

        if ($acceso->num_rows > 0) {
            $r = true;
        }
        return $r;
    }

    public function accesoClientes()
    {
        $r = false;
        $sql = "SELECT * FROM `clientes` WHERE `dni` LIKE '%{$this->dni}%'";
        $cliente = $this->con->sqlReturn($sql);

        if ($cliente->num_rows > 0) {
            $r = true;
            $array = array();
            $sql2 = "SELECT * FROM `eventos` WHERE `usuario` LIKE '%{$this->dni}%' ORDER BY tramite";
            $acceso = $this->con->sqlReturn($sql2);

            if ($acceso->num_rows > 0) {
                while ($row = mysqli_fetch_assoc($acceso)) {
                    $array[] = $row;
                }
                $r = $array;
            }
        }
        return $r;
    }

}

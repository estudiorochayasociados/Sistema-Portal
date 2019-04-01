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
        $sql = "SELECT * FROM clientes WHERE dni LIKE '%" . $this->dni . "%' GROUP BY dni";
        $cliente = $this->con->sqlReturn($sql);
        $array = mysqli_fetch_assoc($cliente);
        return $array;
    }

    public function leerTodos()
    {
        $sql = "SELECT * FROM clientes WHERE dni LIKE '%" . $this->dni . "%'";
        $cliente = $this->con->sqlReturn($sql);
        while ($row = mysqli_fetch_assoc($cliente)){
            $array[] = $row;
        }
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
            while ($row = mysqli_fetch_assoc($cliente)) {
                $array[] = $row;
            }
            $r = $array;
        }

        return $r;
    }

    public function compararLotes()
    {
        $lotes1 = $this->obtenerLotes();

        $eventoLotes = new Eventos;
        $eventoLotes->set("usuario", $this->dni);
        $lotes2 = $eventoLotes->obtenerLotes();

        if ($lotes2 == false) {
            return $lotes1;
        } else {
            $arrayLotes2 = array();
            foreach ($lotes2 as $item) {
                if (mb_strpos($item['lote'], ',') !== false) {
                    $itemExp = explode(",", $item["lote"]);
                    foreach ($itemExp as $explotado) {
                        $arrayLotes2[] = $explotado;
                    }
                } else {
                    array_push($arrayLotes2, $item["lote"]);
                }
            }

            $arrayFinal = array();
            foreach ($lotes1 as $item) {
                if (!in_array($item["lote"], $arrayLotes2)) {
                    $arrayFinal[] = $item;
                }
            }

            return $arrayFinal;
        }

    }
}
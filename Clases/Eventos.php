<?php namespace Clases;


class Eventos
{
    //Atributos
    public $id;
    public $tramite;
    public $observacion;
    public $lote;
    public $start;
    public $end;
    public $usuario;
    public $estado;
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

    public function agregar()
    {
        $query = "INSERT INTO 
        eventos(tramite,observacion,lote,start,end,usuario,estado)
        VALUES('$this->tramite','$this->observacion','$this->lote','$this->start','$this->end','$this->usuario','$this->estado')";

        $this->con->sqlReturn($query);

        return true;
    }

    public function modificar()
    {
        $query = "UPDATE eventos SET 
        tramite = '$this->tramite',
        observacion = '$this->observacion',
        lote = '$this->lote',
        start = '$this->start',
        end = '$this->end',
        usuario = '$this->usuario',
        estado = '$this->estado'
        WHERE id = '$this->id'";

        $this->con->sqlReturn($query);

        return true;
    }

    public function eliminar()
    {
        $query = "DELETE FROM eventos WHERE id = $this->id";
        $this->con->sqlReturn($query);

        //Respuesta de la consulta
        return true;
    }

    public function leer()
    {
        $array = array();
        $sql = "SELECT * FROM eventos";
        $eventos = $this->con->sqlReturn($sql);
        while ($row = mysqli_fetch_assoc($eventos)) {
            $array[] = $row;
        }
        return $array;
    }

    public function leerUnico()
    {
        $array = array();
        $sql = "SELECT * FROM eventos WHERE tramite = ".$this->tramite;
        $eventos = $this->con->sqlReturn($sql);
        $array = mysqli_fetch_assoc($eventos);

        return $array;
    }

    public function leerTramites()
    {
        $array = array();
        $sql = "SELECT tramite FROM eventos WHERE usuario = ".$this->usuario;
        $eventos = $this->con->sqlReturn($sql);
        while ($row = mysqli_fetch_assoc($eventos)) {
            $array[] = $row;
        }
        return $array;
    }

    public function obtenerLotes()
    {
        $array = array();
        $r = false;
        $sql = "SELECT lote FROM eventos WHERE usuario = ".$this->usuario;
        $eventos = $this->con->sqlReturn($sql);

        if ($eventos->num_rows > 0) {
            while($row = mysqli_fetch_assoc($eventos)){
                $array[] = $row;
            }
            $r = $array;
        }

        return $r;
    }

    public function recordatorios()
    {
        $array = array();
        date_default_timezone_set('America/Argentina/Buenos_Aires');
        $fechaActual = strftime("%Y-%m-%d %H:%M:00");
        $sql = "SELECT *, DATEDIFF('$fechaActual', start) as diferencia FROM eventos HAVING diferencia = -1";

        $eventos = $this->con->sqlReturn($sql);
        while ($row = mysqli_fetch_assoc($eventos)) {
            $array[] = $row;
        }
        return $array;
    }

}
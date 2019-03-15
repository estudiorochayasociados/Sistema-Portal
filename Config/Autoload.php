<?php

namespace Config;
class autoload
{
    public static function runSitio()
    {
        session_start();
        define('URL', "http://" . $_SERVER['HTTP_HOST'] . "/SistemaPortal");
        define('CANONICAL', "http://" . $_SERVER["HTTP_HOST"] . $_SERVER["REQUEST_URI"]);
        define("SALT",hash('sha256','salt@estudiorochayasoc.com.ar'));
        spl_autoload_register(
            function ($clase) {
                $ruta = str_replace("\\", "/", $clase) . ".php";
                include_once $ruta;
            }
        );
    }
}
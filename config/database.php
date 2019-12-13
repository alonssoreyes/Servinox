<?php

class Database {

    public static function conectar() {
        $servidor = "sqlsrv:Server=localhost;Database=snx;";
        $con = new PDO($servidor, "sa", "alonso");
        $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $con->setAttribute(PDO::SQLSRV_ATTR_ENCODING, PDO::SQLSRV_ENCODING_UTF8);


        return $con;
    }

}

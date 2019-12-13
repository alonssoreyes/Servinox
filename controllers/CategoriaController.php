<?php
require_once 'models/categoria.php';
class categoriaController {

    public function index() {
        $categoria = new Categoria();
        
        $cateogorias = $categoria->getCategorias();
    }

}
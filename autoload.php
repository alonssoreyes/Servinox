<?php

function controllers_autoload($classname){
    include 'controllers/'.$classname . '.php';
}

//Autocaerga de clases
spl_autoload_register('controllers_autoload');


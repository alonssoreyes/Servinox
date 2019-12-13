document.addEventListener("DOMContentLoaded", function () {
    const root_url = "http://localhost/Servinox/";
    //Validar formulario de registro
    const formRegistro = document.querySelector("#formRegistro");

    //Validar formulario al hacer submit
    formRegistro.addEventListener('submit', function (e) {
        e.preventDefault();
        const nombre = document.querySelector('#name').value;
        const apellidos = document.querySelector('#lastname').value;
        const email = document.querySelector('#email').value;
        const password = document.querySelector('#password').value;
        const confirmPassword = document.querySelector('#confirmPassword').value;
        
        //Parrafo donde se imprimira el resultado
        const result = document.getElementById('resultado');
        //Expresion regular
        emailReg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,4})+$/;
        if (nombre === '' || apellidos === '') {
            alert('Ingresa tus nombres y apellidos');
        } else if (!emailReg.test(email)) {
            alert('Ingresa un email correcto porfavor');
        }else if(password===''){
            alert('Llena los campos de contraseñas');
        }else if(confirmPassword===''){
            alert('Llena los campos de contraseñas');
        }else if (password !== confirmPassword) {
            alert('Escribe contraseñas iguales');
        } else {
            const xhr = new XMLHttpRequest();
            const parametros = `name=${nombre}&lastname=${apellidos}&email=${email}&password=${password}`;
            xhr.open('POST', root_url + "cliente/guardar", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.setRequestHeader("Content-length", parametros.length);
            xhr.setRequestHeader("Connection", "close");
            xhr.onreadystatechange = function (response) {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    result.classList.add('text-success');
                    result.classList.remove('text-danger');
                    result.innerHTML = 'Registro echo correctamente';
                }else{
                    result.classList.add('text-danger');
                    result.classList.remove('text-success');
                    result.innerHTML = 'Registr fallido';
                }
            }

            xhr.send(parametros);
        }
    });



});

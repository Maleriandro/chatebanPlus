const form = $('form');
const usuario = $('#usuario');
const contraseña = $('#contraseña');

form.on('submit', enviarDatos());
var user;

function enviarDatos() {
    console.log(usuario.val())

    user = usuario.val()

    debugger;


}
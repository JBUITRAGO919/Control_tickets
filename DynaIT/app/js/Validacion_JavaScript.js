
//funciones para el cambio de estado cerrado a abierto 
function cambio_estado_cerrado_abierto(){
    var seleccion = confirm(" ¿ Reabrir el ticket nuevamente ?");
    if (seleccion) {

        //este condicion nos permite confirmar si se cambia el estado de del ticcket
        //cambiendo el seleccvalu de la lista desplegable
        document.ready = document.getElementById("List_estados").value = '2';
        alert("Se abrio el ticket nuevamente agregue un motivo")
    }
    else
    {        
        document.ready = document.getElementById("List_estados").value = '6';
    }    
    return seleccion;
}


//funciones para el cambio de estado cerrado a en proceso 
function cambio_estado_cerrado_proceso() {
    var seleccion = confirm(" ¿ Dejar el estdo del ticket en proceso nuevamente?");
    if (seleccion) {
        //este condicion nos permite confirmar si se cambia el estado de del ticcket
        //cambiendo el seleccvalu de la lista desplegable
        document.ready = document.getElementById("List_estados").value = '3';
        alert(" El estado del ticket se modifico en proceso nuevamente ")
    }
    else {
        document.ready = document.getElementById("List_estados").value = '6';
    }
    return seleccion;
}

//funciones para el cambio de estado cerrado a pendiente
function cambio_estado_cerrado_pendiente() {
    var seleccion = confirm(" ¿ Dejar el estado del ticket pendiente ?");
    if (seleccion) {
        //este condicion nos permite confirmar si se cambia el estado de del ticcket
        //cambiendo el seleccvalu de la lista desplegable
        document.ready = document.getElementById("List_estados").value = '4';
        alert(" El estado del ticket se modifico a pendiente nuevamente ")
    }
    else {
        document.ready = document.getElementById("List_estados").value = '6';
    }
    return seleccion;
}

//funciones para el cambio de estado cerrado a resuelto
function cambio_estado_cerrado_resuelto()
{

    var seleccion = confirm(" ¿ Dejar el estdo del ticket en resuelto ?");
    if (seleccion) {
        //este condicion nos permite confirmar si se cambia el estado de del ticcket
        //cambiendo el seleccvalu de la lista desplegable
        document.ready = document.getElementById("List_estados").value = '5';
        alert(" El estado del ticket se modifico a resuelto nuevamente ")
    }
    else {
        document.ready = document.getElementById("List_estados").value = '6';
        return seleccion;
    }
}

function agregar_creditos()
{
    
    $("#Editar_credito").modal("show");
}

function ver_adjuntos()
{
    
    alert('ayudaaaaa');
    //$("#adjunto_nota").modal("show");
}
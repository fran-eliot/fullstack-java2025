function ejercicio1(){
   let num = parseInt(window.prompt('Introduzca un número: '));
    let cifras = 0;

    if (isNaN(num)) {
        return "Por favor, introduzca un número válido.";
    }
    if (num === 0) {
        return 1;
    }

    num = Math.abs(num);

    do{
        num = Math.floor(num / 10)
        cifras++;
    }while(num>0);

    return cifras;
}
function ejercicio21(){
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

function ejercicio22(){
    let num = parseInt(window.prompt('Introduzca un número: '));
    let linea = ''; 
    for (let i = 0; i < num; i++) {
        linea += '_'; 
    }

    console.log(linea); 

}

function ejercicio23(){
    let num = parseInt(window.prompt('Introduzca un número: '));
    let linea = ''; 
    for (let i = 0; i < num; i++) {
        linea += '*+_'; 
    }

    console.log(linea); 
}

function ejercicio24(){
    let num = parseInt(window.prompt('Introduzca un número: '));
    let linea = ''; 

    for(let i=0;i<num;i++){
        for (let j=0;j<=i;j++){
            linea +='*';
        }
        console.log(linea);
        linea = '';
    }
}

function diasMes(mes){
    const diasMes = [31,28,31,30,31,30,31,31,30,31,30,31];
    let dias = 0;
    for(let i=mes;i>0;i--){
        dias += diasMes[i];
    }
    return dias;
}

function ejercicio25(){
    let dia1 = parseInt(window.prompt('Introduzca día 1: '));
    let mes1 = parseInt(window.prompt('Introduzca mes 1: '));
    let dia2 = parseInt(window.prompt('Introduzca día 2: '));
    let mes2 = parseInt(window.prompt('Introduzca mes 2: '));

    let dias1 =diasMes(mes1-1)+dia1;
    let dias2 = diasMes(mes2-1)+dia2;

    return (Math.abs(dias1-dias2));

}
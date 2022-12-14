export function getFirstDayOfMonth(year, month) {
    return new Date(year, month, 1);
}

export function getLastDayOfMonth(year, month) {
    return new Date(year, month + 1, 0);
}

export function primerDiaSemana(d) {
    let dt = new Date(d);
    let day = dt.getDay()
    let diff = dt.getDate() - day + (day === 0 ? -6 : 1);
    return new Date(dt.setDate(diff));    
}

export function crearCalendario(d) {
    let fecha = d
    let prueba = []
    let prueba_semana = []
    let dia = []
    const prueba_arreglo = []
    let text = ''
    let contador = 0
    for(let x = 0; x<6;x++){
        for(let y = 0; y<7;y++){      
            let mes = fecha.getMonth() + 1
            let numero = fecha.getDate()
            let anio = fecha.getFullYear()
            let fecha_completa = numero +'/'+ mes +'/' +anio
            text = '{"dia":' +fecha.getDate() +',"fecha": "' +fecha_completa +'"}'
            //prueba_arreglo.push(JSON.parse(text)) //opcion 1
            //prueba_semana.push(fecha.getDate()) //opcion 2
            prueba_semana.push(JSON.parse(text))
            dia.push(fecha_completa)
            fecha.setDate(d.getDate()+1)
            contador++
        }    
        prueba.push(prueba_semana)
        prueba_semana = []
    }
    console.log(prueba_arreglo)
    return prueba
}

export function obtenerMes(month) {
  switch (month) {
    case 0: {
        return 'Enero'
        break
    }
    case 1: {
        return 'Febrero'
        break
    }
    case 2: {
        return 'Marzo'
        break
    }
    case 3: {
        return 'Abril'
        break
    }
    case 4: {
        return 'Mayo'
        break
    }
    case 5: {
        return 'Junio'
        break
    }
    case 6: {
        return 'Julio'
        break
    }
    case 7: {
        return 'Agosto'
        break
    }
    case 8: {
        return 'Septiembre'
        break
    }
    case 9: {
        return 'Octubre'
        break
    }
    case 10: {
        return 'Noviembre'
        break
    }
    case 11: {
        return 'Diciembre'
        break
    }    
    default: {
      return('Error');
      break;
    }
  }
}
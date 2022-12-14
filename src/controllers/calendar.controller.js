import { pool } from "../database.js";
import { getFirstDayOfMonth , getLastDayOfMonth , primerDiaSemana , crearCalendario, obtenerMes } from "../lib/calendario.js"

export const renderUserCalendar = async(req, res, next) => {
    let hoy = new Date()
    let mes = hoy.getMonth()
    let dia = hoy.getDate()
    let anio = hoy.getFullYear()
    let fecha = {}
    fecha.mes = obtenerMes(mes)
    fecha.dia = dia
    fecha.anio = anio
    fecha.primer = getFirstDayOfMonth(anio,mes)
    fecha.ultimo = getLastDayOfMonth(anio,mes)
    fecha.lunes = primerDiaSemana(fecha.primer)
    let calendario = crearCalendario(fecha.lunes)
    const [rows] = await pool.query("SELECT * FROM bloque");
    // console.log("Primer Lunes", fecha.lunes)
    // console.log("Mes", mes)
    // console.log("Dia", dia)
    // console.log("Año", anio)
    // console.log({calendario})
    console.log([rows])
    res.render("calendar",{fecha , calendario , bloques : rows});
  };


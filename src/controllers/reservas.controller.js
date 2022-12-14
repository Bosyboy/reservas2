import { pool } from "../database.js";

export const agregarPersona = async (req, res, next) => {
    const { rut, nombres, apepat, apemat, correo, telefono, prevision } = req.body;
    const nuevo = {
      rut,
      nombres,
      apepat,
      apemat,
      telefono,
      correo,
      idusuario : req.user.id
    }; 
    await pool.query("INSERT INTO personas set ?", [nuevo])
    const [persona] = await pool.query('SELECT idpersonas FROM personas WHERE idusuario = ?', [req.user.id])
    const paciente = {
        idpersonas : persona[0].idpersonas,
        prevision
    };
    console.log(paciente)
    res.redirect("/reservas")
};

export const listarReservas = async (req, res, next) => {
    const [persona] = await pool.query('SELECT * FROM personas WHERE idusuario = ?', [req.user.id])
    const [pacientes] = await pool.query('SELECT a.*, b.* FROM personas a JOIN pacientes b ON a.idpersonas = b.idpersonas WHERE a.idusuario = ?', [req.user.id])
    const [reservas] = await pool.query('SELECT a.idreservas, DATE_FORMAT(b.fecha,"%d/%m/%Y") AS fecha, DATE_FORMAT(c.comienza,"%H:%i") AS hora, CONCAT(e.nombres, " ",e.apepat, " ", e.apemat) AS nombre, f.nombre AS servicio FROM reservas a JOIN agenda b ON a.idagenda = b.idagenda JOIN bloque c ON b.idbloque = c.idbloque JOIN empleados d ON d.idempleados = b.idempleados JOIN personas e ON e.idpersonas = d.idpersonas JOIN servicios f ON f.idservicios = d.idservicios WHERE a.idusuario = ? ORDER BY a.idreservas ASC', [req.user.id])
    const [rows] = await pool.query("SELECT * FROM servicios")
    res.render("reservas/reservas",{ servicios : rows , reservas : reservas , reservas : reservas, pacientes : pacientes, persona: persona})
};

export const buscarReserva = async (req, res, next) => {
    let fechaForm = req.body.fecha
    let serviciosForm = req.body.servicios
    let arr1 = fechaForm.split('/')
    let fecha = arr1[2]+'-'+arr1[1]+'-'+arr1[0]
    console.log(serviciosForm)
    const [reservas] = await pool.query('SELECT a.idreservas, DATE_FORMAT(b.fecha,"%d/%m/%Y") AS fecha, DATE_FORMAT(c.comienza,"%H:%i") AS hora, CONCAT(e.nombres, " ",e.apepat, " ", e.apemat) AS nombre, f.nombre AS servicio FROM reservas a JOIN agenda b ON a.idagenda = b.idagenda JOIN bloque c ON b.idbloque = c.idbloque JOIN empleados d ON d.idempleados = b.idempleados JOIN personas e ON e.idpersonas = d.idpersonas JOIN servicios f ON f.idservicios = d.idservicios WHERE a.idusuario = ? ORDER BY a.idreservas ASC', [req.user.id]) 
    const [horas] = await pool.query('SELECT DATE_FORMAT(a.fecha,"%d/%m/%Y") AS fecha, CONCAT(d.nombres, " ",d.apepat, " ", d.apemat) AS nombre , DATE_FORMAT(b.comienza,"%H:%i") AS hora, a.idagenda FROM agenda as a INNER JOIN bloque AS b ON a.idbloque = b.idbloque INNER JOIN empleados AS c ON a.idempleados = c.idempleados INNER JOIN personas AS d ON c.idpersonas = d.idpersonas LEFT JOIN reservas e ON e.idagenda = a.idagenda WHERE DATE(a.fecha) >= ? AND c.idservicios = ? AND e.idagenda IS NULL ORDER by a.fecha ASC LIMIT 5', [fecha, serviciosForm]) 
    const [rows] = await pool.query("SELECT * FROM servicios")
    res.render("reservas/reservas",{ servicios : rows , reservas : reservas , reservas : reservas, pacientes : pacientes, persona: persona})
};
  
export const tomarReserva = async (req, res, next) => {
    const { id } = req.params
    const nuevo = { 
      idusuario : req.user.id,
      idagenda : id,
      estado : 0 
    }
    await pool.query("INSERT INTO reservas set ?", [nuevo])
    res.redirect("/reservas")
};

export const eliminarReserva = async (req, res, next) => {
    const { id } = req.params
    await pool.query("DELETE FROM reservas WHERE idreservas = ?", id)
    res.redirect("/reservas")
};  
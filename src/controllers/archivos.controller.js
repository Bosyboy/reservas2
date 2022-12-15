import { pool } from "../database.js";

export const archivoPreparar = async(req, res) => {
    res.render('archivos/add');
};

export const agregarArchivo = async(req, res) => {
    const { idatencion, observacion } = req.body;
    const newLink = {
        idatencion: idatencion,
        observacion,
        documento: req.file.filename
    };
    await pool.query('INSERT INTO documentos set ?', [newLink]);
    req.flash('success', 'Archivo creado');
    res.redirect('/archivos');
};

export const listarArchivos = async(req, res) => {
    const misarchivos = await pool.query('SELECT id_archivo , id_usuario, nom_rom,  observacion, fecha_subida, documento, correo, fullname FROM archivos a LEFT OUTER JOIN users b ON a.id_usuario = b.id LEFT OUTER JOIN rom c ON a.idatencion = c.idatencion WHERE id_usuario = ?', [req.user.id]);
    res.render('archivos/list', { misarchivos });
};

export const listarClientes = async(req, res) => {
    const misarchivos = await pool.query('SELECT id_archivo , id_usuario,  observacion, fecha_subida, documento, correo, fullname FROM archivos a LEFT OUTER JOIN users b ON a.idatencion = b.rom WHERE b.id = ? ORDER BY a.id_archivo DESC', [req.user.id]);
    res.render('archivos/listadoClientes', { misarchivos });
};

export const listarArchivosMenu = async(req, res) => {
    const listaArchivos = await pool.query('SELECT id_archivo , id_usuario, nom_rom,  observacion, fecha_subida, documento, correo, fullname FROM archivos a LEFT OUTER JOIN users b ON a.id_usuario = b.id LEFT OUTER JOIN rom c ON a.idatencion = c.idatencion');
    const archivos = underscore.groupBy(listaArchivos, 'nom_rom');
    res.send({ archivos });
};

export const borrarArchivo = async(req, res) => {
    const { id_archivo } = req.params;
    await pool.query('DELETE FROM archivos WHERE id_archivo = ?', [id_archivo]);
    req.flash('success', 'Archivo removido');
    res.redirect('/archivos');
};

export const prepararEditarArchivo = async(req, res) => {
    const { id_archivo } = req.params;
    const roms = await pool.query('SELECT * FROM rom');
    const archivos = await pool.query('SELECT * FROM archivos WHERE id_archivo = ?', [id_archivo]);
    console.log(archivos);
    res.render('archivos/edit', { archivo: archivos[0], roms });
};

export const editarArchivo = async(req, res) => {
    const { id_archivo } = req.params;
    const { idatencion, observacion } = req.body;
    const newLink = {
        idatencion: idatencion,
        observacion,
    };
    await pool.query('UPDATE archivos set ? WHERE id_archivo = ?', [newLink, id_archivo]);
    req.flash('success', 'Archivo actualizado');
    res.redirect('/archivos');
};
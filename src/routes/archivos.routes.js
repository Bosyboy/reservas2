import { Router } from "express";

import { isLoggedIn } from "../lib/auth.js";

import { archivoPreparar, agregarArchivo, listarArchivos, borrarArchivo, prepararEditarArchivo, listarClientes, listarArchivosMenu, editarArchivo } from '../controllers/archivos.controller.js';
import { renderDemo } from "../controllers/index.controller.js";
const router = Router();

router.use(isLoggedIn);

// Routes
router.get('/add', isLoggedIn, renderDemo);
router.post('/add', isLoggedIn, renderDemo);
router.get('/', isLoggedIn, renderDemo);
router.get('/listadoClientes', isLoggedIn, renderDemo);
router.get('/menuar', isLoggedIn, renderDemo);
router.get('/delete/:id_archivo', isLoggedIn, renderDemo);
router.get('/edit/:id_archivo', isLoggedIn, renderDemo);
router.post('/edit/:id_archivo', isLoggedIn, renderDemo);

export default router;
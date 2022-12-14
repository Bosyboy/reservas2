import { Router } from "express";
import { isLoggedIn } from "../lib/auth.js";
import {
  crearUsuarios,
  agregarUsuarios,
  mostrarUsuarios,
  borrarUsuario,
  editarUsuario,
  mostrarEditarUsuario,
} from "../controllers/usuarios.controller.js";

const router = Router();
// Authorization
router.use(isLoggedIn);

// Routes
router.get("/add", crearUsuarios);
router.post("/add", agregarUsuarios);
router.get("/", isLoggedIn, mostrarUsuarios);
router.get("/delete/:id", borrarUsuario);
router.get("/edit/:id", editarUsuario);
router.post("/edit/:id", mostrarEditarUsuario);

export default router;

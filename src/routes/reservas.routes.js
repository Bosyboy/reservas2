import { Router } from "express";
import { isLoggedIn } from "../lib/auth.js";
import { listarReservas, buscarReserva, tomarReserva, eliminarReserva , agregarPersona, confirmarReserva, pendienteReserva  } from "../controllers/reservas.controller.js";
import { renderDemo } from "../controllers/index.controller.js";

const router = Router();

router.use(isLoggedIn);

router.get("/",isLoggedIn, listarReservas);
router.post("/",isLoggedIn, buscarReserva);
router.post("/agregar",isLoggedIn, agregarPersona);
router.get("/tomar/:id",isLoggedIn, tomarReserva);
router.get("/eliminar/:id",isLoggedIn, eliminarReserva);
router.get("/confirmar/:id",isLoggedIn, confirmarReserva);
router.get("/pendiente/:id",isLoggedIn, pendienteReserva);
router.get("/atender/:id",isLoggedIn, renderDemo);

export default router;

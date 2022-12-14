import { Router } from "express";
import { isLoggedIn } from "../lib/auth.js";
import { listarReservas, buscarReserva, tomarReserva, eliminarReserva , agregarPersona  } from "../controllers/reservas.controller.js";

const router = Router();

router.use(isLoggedIn);

router.get("/", listarReservas);
router.post("/", buscarReserva);
router.post("/agregar", agregarPersona);
router.get("/tomar/:id", tomarReserva);
router.get("/eliminar/:id", eliminarReserva);

export default router;

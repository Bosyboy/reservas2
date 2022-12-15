import { Router } from "express";
import { isLoggedIn } from "../lib/auth.js";
import { renderUserProfile } from "../controllers/user.controller.js";
import { listarReservas } from "../controllers/reservas.controller.js";

const router = Router();

router.get("/reservas", isLoggedIn, listarReservas);


export default router;

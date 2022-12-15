import { Router } from "express";
import auth from "./auth.routes.js";
import index from "./index.routes.js";
import user from "./user.routes.js";
import calendar from "./calendar.routes.js";
import usuarios from "./usuarios.routes.js";
import reservas from "./reservas.routes.js";
import archivos from "./archivos.routes.js";

const router = Router();

router.use(index);
router.use(auth);
router.use(user);
router.use("/calendar", calendar);
router.use("/usuarios", usuarios);
router.use("/reservas", reservas);
router.use("/archivos", archivos);



export default router;

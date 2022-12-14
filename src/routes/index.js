import { Router } from "express";
import auth from "./auth.routes.js";
import index from "./index.routes.js";
import links from "./links.routes.js";
import user from "./user.routes.js";
import calendar from "./calendar.routes.js";
import usuarios from "./usuarios.routes.js";
import reservas from "./reservas.routes.js";

const router = Router();

router.use(index);
router.use(auth);
router.use(user);
router.use("/links", links);
router.use("/calendar", calendar);
router.use("/usuarios", usuarios);
router.use("/reservas", reservas);



export default router;

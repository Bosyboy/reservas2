import { Router } from "express";
const router = Router();

import { renderIndex, ping, renderDemo } from "../controllers/index.controller.js";

router.get("/", renderIndex);
router.get("/demo", renderDemo);

router.get('/ping', ping);

export default router;

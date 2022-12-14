import { Router } from "express";
import { isLoggedIn } from "../lib/auth.js";
import {
renderUserCalendar
} from "../controllers/calendar.controller.js";

const router = Router();
// Authorization
router.use(isLoggedIn);

// Routes
router.get("/", isLoggedIn, renderUserCalendar);

export default router;



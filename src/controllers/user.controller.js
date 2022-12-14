import { pool } from "../database.js";

export const renderUserProfile = async (req, res, next) => {
  const [rows] = await pool.query("SELECT * FROM servicios");
  res.render("profile",{ servicios: rows });
};
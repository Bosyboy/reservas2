import { pool } from "../database.js";

export const crearUsuarios = (req, res) => {
  res.render("usuarios/add");
};

export const agregarUsuarios = async (req, res) => {
  const { title, url, description } = req.body;
  const newLink = {
    title,
    url,
    description,
    user_id: req.user.id,
  };
  await pool.query("INSERT INTO usuarios set ?", [newLink]);
  req.flash("success", "Link Saved Successfully");
  res.redirect("/usuarios");
};

export const mostrarUsuarios = async (req, res) => {
  const [rows] = await pool.query("SELECT * FROM users");
  res.render("usuarios/list", { usuarios: rows });
};

export const borrarUsuario = async (req, res) => {
  const { id } = req.params;
  await pool.query("DELETE FROM users WHERE id = ?", [id]);
  req.flash("success", "Link Removed Successfully");
  res.redirect("/usuarios");
};

export const editarUsuario = async (req, res) => {
  const { id } = req.params;
  const [rows] = await pool.query("SELECT * FROM users WHERE id = ?", [id]);
  res.render("usuarios/edit", { usuario: rows[0] });
};

export const mostrarEditarUsuario = async (req, res) => {
  const { id } = req.params;
  const { title, description, url } = req.body;
  const newLink = {
    title,
    description,
    url,
  };
  await pool.query("UPDATE usuarios set ? WHERE id = ?", [newLink, id]);
  req.flash("success", "Link Updated Successfully");
  res.redirect("/usuarios");
};
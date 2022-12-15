import { config } from "dotenv";
config();

export const database = {
  connectionLimit: 10,
  host: process.env.DB_HOST || 'containers-us-west-128.railway.app',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || 'Vcg10pQfK8k5im7JEzJx',
  database: process.env.DB_NAME || 'railway',
  port: process.env.DB_PORT || 7949
};

export const port = process.env.PORT || 4000;

SELECT a.idreservas, b.fecha, c.comienza, CONCAT(e.nombres, " ",e.apepat, " ", e.apemat) AS nombre, f.nombre
FROM reservas a
JOIN agenda b ON a.idagenda = b.idagenda
JOIN bloque c ON b.idbloque = c.idbloque
JOIN empleados d ON d.idempleados = b.idempleados
JOIN personas e ON e.idpersonas = d.idpersonas
JOIN servicios f ON f.idservicios = d.idservicios
WHERE a.idusuario = 3 ORDER BY a.idreservas ASC 
SELECT a.idreservas, a.estado, DATE_FORMAT(b.fecha,"%d/%m/%Y") AS fecha, DATE_FORMAT(c.comienza,"%H:%i") AS hora, CONCAT(g.nombres, " ",g.apepat, " ", g.apemat) AS nombre
FROM reservas a
JOIN agenda b ON a.idagenda = b.idagenda
JOIN bloque c ON b.idbloque = c.idbloque
JOIN empleados d ON d.idempleados = b.idempleados
JOIN personas e ON e.idpersonas = d.idpersonas
JOIN servicios f ON f.idservicios = d.idservicios
JOIN personas g ON g.idusuario = a.idusuario
WHERE e.idusuario = 2 AND a.estado = "Confirmado"
ORDER BY a.idreservas ASC
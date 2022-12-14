SELECT DATE_FORMAT(a.fecha,"%d/%m/%Y") AS fecha, CONCAT(d.nombres, " ",d.apepat, " ", d.apemat) AS nombre, DATE_FORMAT(b.comienza,"%H:%i") AS hora, a.idagenda
FROM agenda AS a
INNER JOIN bloque AS b ON a.idbloque = b.idbloque
INNER JOIN empleados AS c ON a.idempleados = c.idempleados
INNER JOIN personas AS d ON c.idpersonas = d.idpersonas
WHERE DATE(a.fecha) >= "2022-11-11" reservasreservas
ORDER BY a.fecha ASC
LIMIT 5
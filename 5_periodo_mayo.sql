SELECT
    periodo,
    COUNT(s.ID_SOLICITUD) AS total_solicitudes,
    COUNT(CASE WHEN s.DECISION = 'ACEPTADO' THEN s.ID_SOLICITUD END) AS aceptadas,
    COUNT(CASE WHEN s.DECISION = 'RECHAZADO' THEN s.ID_SOLICITUD END) AS rechazadas,
    ROUND(
        COUNT(CASE WHEN s.DECISION = 'ACEPTADO' THEN s.ID_SOLICITUD END)*100.0/
        (COUNT(DISTINCT s.ID_SOLICITUD) - COUNT(CASE WHEN s.DECISION = 'ABANDONADO' THEN s.ID_SOLICITUD END)), 2
    ) AS tasa_aceptacion,
    ROUND(AVG(s.IMPORTE_SOL)*1000,2) AS promedio_importe,
    ROUND(
        SUM(CASE WHEN co.IMPAGO = 1 THEN 1 ELSE 0 END)*100.0/COUNT(co.ID_CONTRATO), 2
    ) AS tasa_impago
FROM (
    SELECT *, 
        CASE 
            WHEN STR_TO_DATE(FECHA_DEMANDA, '%d/%m/%Y') < '2019-05-01' THEN 'Antes de mayo'
            ELSE 'Después de mayo'
        END AS periodo
    FROM Solicitudes
) s
LEFT JOIN Contratos co ON s.ID_SOLICITUD = co.ID_SOLICITUD
GROUP BY periodo;



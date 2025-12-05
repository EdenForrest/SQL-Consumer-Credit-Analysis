SELECT 
    COUNT(*) AS total_clientes,
    SUM(MARCA_FRAUDE) AS clientes_sospechosos,
    ROUND( (SUM(MARCA_FRAUDE) * 100.0) / COUNT(*), 2) AS porcentaje_fraude
FROM Clientes;

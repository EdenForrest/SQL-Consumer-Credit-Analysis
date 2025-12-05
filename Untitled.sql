SELECT 
    100.0 * (COUNT(*) - COUNT(EDAD)) / COUNT(*) AS pct_null_edad,
    100.0 * (COUNT(*) - COUNT(TINGRESOS)) / COUNT(*) AS pct_null_ingresos,
    100.0 * (COUNT(*) - COUNT(GASTOSVIV)) / COUNT(*) AS pct_null_gastosviv,
    100.0 * (COUNT(*) - COUNT(OTROSGASTOS1)) / COUNT(*) AS pct_null_otrosgastos,
    100.0 * (COUNT(*) - COUNT(NACIONALIDAD)) / COUNT(*) AS pct_null_nacionalidad,
    100.0 * (COUNT(*) - COUNT(VIVIENDA)) / COUNT(*) AS pct_null_vivienda,
    100.0 * (COUNT(*) - COUNT(MARCA_FRAUDE)) / COUNT(*) AS pct_null_marca_fraude
FROM Clientes;

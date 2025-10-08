-- ALTER TABLE vagas_de_emprego ADD COLUMN salario_medio_segmento REAL;

UPDATE vagas_de_emprego
SET
    salario_medio_segmento = s.Sal_Medio
FROM (
    SELECT 
        tamanho_empresa,
        setor,
        ROUND(AVG(salario_medio), 2) AS Sal_Medio
    FROM vagas_de_emprego
    GROUP BY tamanho_empresa, setor
) AS s
WHERE vagas_de_emprego.tamanho_empresa = s.tamanho_empresa
AND vagas_de_emprego.setor = s.setor;
-- PRAGMA table_info(vagas_de_emprego)

-- SELECT * FROM vagas_de_emprego;

WITH tb_empresas_vagas AS ( 

    SELECT tamanho_empresa,
        setor,
        count(*) AS QtdeVagas,
        ROUND(AVG(salario_medio), 2) AS Sal_Medio
    FROM vagas_de_emprego
    GROUP BY tamanho_empresa, setor
)

SELECT * 
FROM tb_empresas_vagas
ORDER BY tamanho_empresa, QtdeVagas DESC;

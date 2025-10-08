WITH setor_cargo_medio AS (

    SELECT setor,
        cargo,
        ROUND(AVG(salario_medio), 2) AS Salario_Medio,
        count(*) AS QtdeVagas,
        row_number() OVER (PARTITION BY setor ORDER BY count(*) DESC) AS rn
    FROM vagas_de_emprego
    GROUP BY setor, cargo
)

SELECT setor,
       cargo,
       QtdeVagas,
       Salario_Medio 
FROM setor_cargo_medio
WHERE rn = 1
ORDER BY Salario_Medio DESC; 
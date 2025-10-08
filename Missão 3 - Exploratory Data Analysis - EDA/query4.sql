SELECT estado,
       ROUND(AVG(salario_medio), 2) AS SalarioMedio,
       count(*) AS QtdeVagas
FROM vagas_de_emprego
GROUP BY estado
ORDER BY SalarioMedio DESC
LIMIT 3;
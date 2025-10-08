SELECT CASE
        WHEN tem_Python = 1 THEN 'Exigem Python' ELSE 'Não Exigem' END AS condicao_python,
        ROUND(AVG(salario_medio), 2) as salario_medio_calculado
FROM vagas_de_emprego
GROUP BY tem_Python;


SELECT CASE
        WHEN tem_PowerBI = 1 THEN 'Exigem Power BI' ELSE 'Não Exigem' END AS condicao_powerBI,
        ROUND(AVG(salario_medio), 2) as salario_medio_calculado
FROM vagas_de_emprego
GROUP BY tem_PowerBI;


SELECT CASE
        WHEN tem_SQL = 1 THEN 'Exigem SQL' ELSE 'Não Exigem' END AS condicao_SQL,
        ROUND(AVG(salario_medio), 2) as salario_medio_calculado
FROM vagas_de_emprego
GROUP BY tem_SQL;
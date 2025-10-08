SELECT cargo,
       ROUND(avg(salario_medio), 2) AS Melhores_Salarios_Med
FROM vagas_de_emprego
GROUP BY cargo
ORDER BY Salario_Medio DESC
LIMIT 3;

SELECT cargo,
       ROUND(avg(salario_medio), 2) AS Menores_Salarios_Med
FROM vagas_de_emprego
GROUP BY cargo
ORDER BY Salario_Medio
LIMIT 3;



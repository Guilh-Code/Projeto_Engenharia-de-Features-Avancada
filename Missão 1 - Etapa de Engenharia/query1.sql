PRAGMA table_info(vagas_de_emprego);

SELECT count(*) AS Total_Vagas FROM vagas_de_emprego;

SELECT * FROM vagas_de_emprego LIMIT 5;

SELECT cargo, count(*) AS Total_Vagas FROM vagas_de_emprego GROUP BY cargo ORDER BY Total_Vagas DESC;

SELECT nivel_experiencia, count(*) AS Total_Vagas FROM vagas_de_emprego GROUP BY nivel_experiencia ORDER BY Total_Vagas DESC;

SELECT tamanho_empresa, count(*) AS Total FROM vagas_de_emprego GROUP BY tamanho_empresa ORDER BY Total DESC;


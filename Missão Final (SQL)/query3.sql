SELECT nivel_experiencia,
       ROUND(AVG(LENGTH(habilidades_necessarias) - LENGTH(REPLACE(habilidades_necessarias, ',', '')) + 1), 2) AS Media
FROM vagas_de_emprego
GROUP BY nivel_experiencia
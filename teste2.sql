SELECT tipo_contratacao,
       cargo, 
       count(*) AS QtdeVagas
FROM vagas_de_emprego
GROUP BY tipo_contratacao, cargo
ORDER BY tipo_contratacao, QtdeVagas DESC;

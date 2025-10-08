SELECT *
FROM vagas_de_emprego
WHERE nivel_experiencia = 'Sênior'
AND desvio_salarial_setor > 25000
AND tem_AWS = 1 AND tem_Python = 1;

ALTER TABLE vagas_de_emprego ADD COLUMN salario_medio_setor REAL;
ALTER TABLE vagas_de_emprego ADD COLUMN desvio_salarial_setor REAL;

UPDATE vagas_de_emprego
SET salario_medio_setor = (
    SELECT ROUND(AVG(salario_medio), 2)
    FROM vagas_de_emprego AS sub
    WHERE sub.setor = vagas_de_emprego.setor
);


 UPDATE vagas_de_emprego
 SET
    desvio_salarial_setor = ROUND((salario_medio - salario_medio_setor), 2);
ALTER TABLE vagas_de_emprego ADD COLUMN salario_min REAL;
ALTER TABLE vagas_de_emprego ADD COLUMN salario_max REAL;
ALTER TABLE vagas_de_emprego ADD COLUMN salario_medio REAL;


UPDATE vagas_de_emprego
SET

    salario_min = CAST(TRIM(SUBSTR(faixa_salarial_usd, 1, INSTR--(faixa_salarial_usd, '-') - 1)) AS REAL),

    salario_max = CAST(TRIM(SUBSTR(faixa_salarial_usd, INSTR--(faixa_salarial_usd, '-') + 1)) AS REAL);

UPDATE vagas_de_emprego
SET

    salario_medio = (salario_max + salario_min) / 2;


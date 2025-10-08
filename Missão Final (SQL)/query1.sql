-- ALTER TABLE vagas_de_emprego ADD COLUMN idade_vaga_dias INTEGER;

UPDATE vagas_de_emprego
SET
    idade_vaga_dias = CAST(JULIANDAY('now') - JULIANDAY(data_postagem) AS INTEGER);
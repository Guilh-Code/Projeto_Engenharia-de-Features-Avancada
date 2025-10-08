-- ALTER TABLE vagas_de_emprego ADD COLUMN popularidade_cargo_contrato INTEGER;

UPDATE vagas_de_emprego
SET
    popularidade_cargo_contrato = p.QtdeVagas
FROM (
    SELECT
        tipo_contratacao,
        cargo,
        count(*) AS QtdeVagas
    FROM vagas_de_emprego
    GROUP BY tipo_contratacao, cargo
) AS p
WHERE vagas_de_emprego.tipo_contratacao = p.tipo_contratacao
AND vagas_de_emprego.cargo = p.cargo;
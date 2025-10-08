-- ALTER TABLE vagas_de_emprego ADD COLUMN estado TEXT;


UPDATE vagas_de_emprego
SET

    estado = UPPER(TRIM(SUBSTR(localizacao, -2)))
    WHERE localizacao LIKE '%, __%' OR localizacao LIKE '%,__%';
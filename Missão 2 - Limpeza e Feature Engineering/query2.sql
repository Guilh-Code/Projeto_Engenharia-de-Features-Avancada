-- WITH RECURSIVE split(habilidade, resto) AS (
-- 
--   SELECT '',
--     habilidades_necessarias || ','
-- 
--   FROM vagas_de_emprego
-- 
--   UNION ALL
--   -- Parte Recursiva: Pega a próxima habilidade da string
--   SELECT
--     -- Pega a primeira habilidade da string 'resto'
--     TRIM(SUBSTR(resto, 1, INSTR(resto, ',') - 1)),
-- 
--     SUBSTR(resto, INSTR(resto, ',') + 1)
-- 
--   FROM split
--   WHERE resto <> ''
-- )
-- 
-- -- Agora que dividimos tudo, podemos agrupar e contar
-- 
-- SELECT
--   habilidade,
--   COUNT(*) AS quantidade
-- FROM split
-- WHERE habilidade <> '' -- Remove as linhas vazias iniciais
-- GROUP BY habilidade
-- ORDER BY quantidade DESC; -- Ordena para ver as mais populares primeiro


ALTER TABLE vagas_de_emprego ADD COLUMN tem_Python INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_Excel INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_Pandas INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_TensorFlow INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_NumPy INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_FastAPI INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_RL INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_Azure INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_SQL INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_HuggingFace INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_Keras INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_PowerBI INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_GCP INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_AWS INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_PyTorch INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_LangChain INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_SckitLearn INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_Flask INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_CUDA INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_R INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN 'tem_C++' INTEGER;
ALTER TABLE vagas_de_emprego ADD COLUMN tem_MLflow INTEGER;


UPDATE vagas_de_emprego
SET

    tem_TensorFlow = CASE WHEN habilidades_necessarias LIKE '%TensorFlow%' THEN 1 ELSE 0 END,
    tem_Excel = CASE WHEN habilidades_necessarias LIKE '%Excel%' THEN 1 ELSE 0 END,
    tem_Pandas = CASE WHEN habilidades_necessarias LIKE '%Pandas%' THEN 1 ELSE 0 END,
    tem_FastAPI = CASE WHEN habilidades_necessarias LIKE '%FastAPI%' THEN 1 ELSE 0 END,
    tem_NumPy = CASE WHEN habilidades_necessarias LIKE '%NumPy%' THEN 1 ELSE 0 END,
    tem_RL = CASE WHEN habilidades_necessarias LIKE '%Reinforcement Learning%' THEN 1 ELSE 0 END,
    tem_CUDA = CASE WHEN habilidades_necessarias LIKE '%CUDA%' THEN 1 ELSE 0 END,
    tem_Azure = CASE WHEN habilidades_necessarias LIKE '%Azure%' THEN 1 ELSE 0 END,
    tem_SQL = CASE WHEN habilidades_necessarias LIKE '%SQL%' THEN 1 ELSE 0 END,
    tem_HuggingFace = CASE WHEN habilidades_necessarias LIKE '%Hugging Face%' THEN 1 ELSE 0 END,
    tem_Keras = CASE WHEN habilidades_necessarias LIKE '%Keras%' THEN 1 ELSE 0 END,
    tem_PowerBI = CASE WHEN habilidades_necessarias LIKE '%Power BI%' THEN 1 ELSE 0 END,
    tem_GCP = CASE WHEN habilidades_necessarias LIKE '%GCP%' THEN 1 ELSE 0 END,
    tem_AWS = CASE WHEN habilidades_necessarias LIKE '%AWS%' THEN 1 ELSE 0 END,
    tem_Python = CASE WHEN habilidades_necessarias LIKE '%Python%' THEN 1 ELSE 0 END,
    tem_PyTorch = CASE WHEN habilidades_necessarias LIKE '%PyTorch%' THEN 1 ELSE 0 END,
    tem_LangChain = CASE WHEN habilidades_necessarias LIKE '%LangChain%' THEN 1 ELSE 0 END,
    tem_SckitLearn = CASE WHEN habilidades_necessarias LIKE '%Scikit-learn%' THEN 1 ELSE 0 END,
    tem_Flask = CASE WHEN habilidades_necessarias LIKE '%Flask%' THEN 1 ELSE 0 END,
    tem_R = CASE WHEN (habilidades_necessarias LIKE 'R, %' OR habilidades_necessarias LIKE '%, R, %' OR habilidades_necessarias LIKE '%, R' OR habilidades_necessarias = 'R') THEN 1 ELSE 0 END,
    'tem_C++' = CASE WHEN habilidades_necessarias LIKE '%C++%' THEN 1 ELSE 0 END,
    tem_MLflow = CASE WHEN habilidades_necessarias LIKE '%MLflow%' THEN 1 ELSE 0 END;
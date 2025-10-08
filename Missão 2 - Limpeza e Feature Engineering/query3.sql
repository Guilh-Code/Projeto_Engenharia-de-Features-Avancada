-- ALTER TABLE vagas_de_emprego ADD COLUMN pref_MLflow INTEGER;
-- ALTER TABLE vagas_de_emprego ADD COLUMN pref_LangChain INTEGER;
-- ALTER TABLE vagas_de_emprego ADD COLUMN pref_FastAPI INTEGER;
-- ALTER TABLE vagas_de_emprego ADD COLUMN pref_KDB INTEGER;
-- ALTER TABLE vagas_de_emprego ADD COLUMN pref_BigQuery INTEGER;
-- ALTER TABLE vagas_de_emprego ADD COLUMN pref_TensorFlow INTEGER;
-- ALTER TABLE vagas_de_emprego ADD COLUMN pref_PyTorch INTEGER;
-- ALTER TABLE vagas_de_emprego ADD COLUMN pref_ScikitLearn INTEGER;

UPDATE vagas_de_emprego
SET

    pref_MLflow = CASE WHEN ferramentas_preferenciais LIKE '%MLflow%' THEN 1 ELSE 0 END,
    pref_LangChain = CASE WHEN ferramentas_preferenciais LIKE '%LangChain%' THEN 1 ELSE 0 END,
    pref_FastAPI = CASE WHEN ferramentas_preferenciais LIKE '%FastAPI%' THEN 1 ELSE 0 END,
    pref_KDB = CASE WHEN ferramentas_preferenciais LIKE '%KDB+%' THEN 1 ELSE 0 END,
    pref_BigQuery = CASE WHEN ferramentas_preferenciais LIKE '%BigQuery%' THEN 1 ELSE 0 END,
    pref_TensorFlow = CASE WHEN ferramentas_preferenciais LIKE '%TensorFlow%' THEN 1 ELSE 0 END,
    pref_PyTorch = CASE WHEN ferramentas_preferenciais LIKE '%PyTorch%' THEN 1 ELSE 0 END,
    pref_ScikitLearn = CASE WHEN ferramentas_preferenciais LIKE '%Scikit-learn%' THEN 1 ELSE 0 END;
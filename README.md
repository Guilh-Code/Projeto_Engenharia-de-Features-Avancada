# Projeto: Engenharia de Features Avançada para Análise do Mercado de IA

<div align="center">
  <img src="https://img.shields.io/badge/Status-Concluído-brightgreen" alt="Status: Concluído">
</div>
<br>

## 📜 Visão Geral do Projeto

Este projeto representa uma imersão profunda na **Engenharia e Análise de Dados**, utilizando um dataset sintético sobre vagas no mercado de Inteligência Artificial. O objetivo principal não foi construir um modelo preditivo de alta performance, mas sim realizar um trabalho minucioso de transformação de dados brutos em uma base analítica rica e inteligente, pronta para qualquer tipo de análise ou modelagem.

O grande diferencial deste projeto é a complexidade e a criatividade aplicadas na **Engenharia de Features com SQL**, demonstrando como extrair o máximo de valor e inteligência de um conjunto de dados antes mesmo da aplicação de algoritmos de Machine Learning.

## 🎯 O Desafio Central

Partindo de um dataset em formato CSV com informações textuais e semi-estruturadas, o desafio era realizar um ciclo completo de Data Engineering e Data Science, com foco em:
1.  Estruturar os dados em um banco de dados relacional (SQLite).
2.  Realizar uma limpeza profunda e uma análise exploratória (EDA) para entender a "personalidade" dos dados.
3.  Criar um conjunto robusto de features numéricas e categóricas a partir de dados brutos.
4.  Diagnosticar a viabilidade de modelos preditivos (Classificação e Regressão) e interpretar seus resultados de forma crítica.

## 🛠️ Tecnologias Utilizadas
* **Banco de Dados:** SQL (SQLite)
* **Análise e Modelagem:** Python
* **Bibliotecas Principais:** Pandas, Scikit-learn, Seaborn, Matplotlib

## 🚀 Fases do Projeto

O projeto foi dividido em duas grandes etapas: a fundação em SQL e a investigação em Python.

### Fase 1: Engenharia de Dados e Análise em SQL (O Coração do Projeto)

Esta foi a fase mais extensa e valiosa, onde transformamos o dado bruto em conhecimento.

#### 1.1. Estruturação e Limpeza
* Os dados foram importados para um banco SQLite.
* A feature mais desafiadora, `faixa_salarial_usd` (ex: "92860-109598"), foi processada com funções de string SQL (`SUBSTR`, `INSTR`) para criar três novas colunas numéricas: `salario_min`, `salario_max` e `salario_medio`.

#### 1.2. Engenharia de Features Avançada
O foco foi criar novas colunas (features) que adicionassem inteligência e contexto ao dataset. As principais features criadas foram:

* **Features Binárias (One-Hot Encoding em SQL):**
    * `tem_Python`, `tem_AWS`, `tem_SQL`, etc. Colunas que indicam com `1` ou `0` a presença de uma habilidade ou ferramenta chave, extraídas da coluna de texto `habilidades_necessarias`.

* **Features Relativas (Contexto de Negócio):**
    * `salario_medio_setor`: Média salarial para cada setor da indústria.
    * `desvio_salarial_setor`: **(Feature de alto impacto)** Mede o quão acima ou abaixo da média de seu setor uma vaga específica está. Transforma um valor absoluto (salário) em um insight relativo.
    * `salario_medio_segmento`: Uma versão ainda mais granular, calculando a média salarial pela combinação de `setor` e `tamanho_empresa`.

* **Features de Demanda:**
    * `popularidade_cargo_contrato`: Mede a "popularidade" (contagem de vagas) de uma combinação específica de `cargo` e `tipo_contratacao`, dando uma noção de oferta e demanda.

* **Features Temporais:**
    * `idade_vaga_dias`: Calcula há quantos dias a vaga foi postada, permitindo análises de tempo.

#### 1.3. Análise de Negócio com Funções de Janela
* Utilizando `ROW_NUMBER() OVER (PARTITION BY ...)` em uma consulta complexa, foi possível identificar o cargo mais requisitado para cada setor da indústria, gerando um insight estratégico de alto valor.

### Fase 2: Modelagem Preditiva e Diagnóstico em Python

Com a base de dados robustecida, a segunda fase focou em testar hipóteses e diagnosticar o poder preditivo dos dados.

#### 2.1. Abordagem de Regressão e Diagnóstico de Data Leakage
* Inicialmente, um modelo de Regressão Linear foi treinado para prever o `salario_medio`. O resultado foi um **R² de 1.00**, um score "perfeito".
* Uma investigação aprofundada revelou que este resultado era devido a um **Vazamento de Dados (Data Leakage)**, causado pelas features de engenharia (`desvio_salarial_setor`, etc.) que continham a própria resposta de forma implícita.
* **A correção do vazamento**, removendo as features problemáticas, demonstrou uma habilidade crucial em MLOps: garantir a integridade e a validade do modelo. Após a correção, o R² tornou-se negativo, provando que as features restantes não possuíam sinal linear para prever o salário.

#### 2.2. Abordagem de Classificação e Otimização
* O projeto pivotou para um problema de classificação: prever o `nivel_experiencia` (Júnior, Pleno, Sênior).
* Um modelo `RandomForestClassifier` foi treinado. Após diversas rodadas de **seleção de features** e otimização com **GridSearchCV**, o modelo atingiu uma acurácia final de **36.62%**.

## 🏁 Conclusão e Principais Aprendizados

O resultado final da modelagem (acurácia de 36.62%) confirmou a hipótese levantada na análise exploratória: o dataset sintético, por ser extremamente balanceado, possui um sinal preditivo muito fraco para a tarefa de classificação de senioridade.

**O verdadeiro sucesso deste projeto não reside na performance do modelo, mas na profundidade do processo e nas habilidades demonstradas:**

> * **O principal produto entregue é um banco de dados analítico, limpo e enriquecido com dezenas de features inteligentes, pronto para gerar insights de negócio.**

As principais competências desenvolvidas foram:
* **SQL Avançado:** Manipulação de strings, funções de janela (`ROW_NUMBER`) e engenharia de features diretamente no banco de dados.
* **Diagnóstico de Modelos:** Identificação e correção de Data Leakage, uma habilidade essencial e avançada em Machine Learning.
* **Pensamento Crítico:** Análise de resultados abaixo do esperado, entendendo que a limitação não estava na técnica, mas na natureza intrínseca dos dados.
* **Otimização de Hiperparâmetros:** Uso de `GridSearchCV` para extrair a performance máxima de um modelo.

Este projeto solidifica a ideia de que a Engenharia de Dados e a criação de features inteligentes são os pilares que sustentam qualquer iniciativa de Ciência de Dados bem-sucedida.


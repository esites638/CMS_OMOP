{{ 
    config(
        materialized='view'
        ) 
}}

WITH stg_concepts AS (
    SELECT * FROM {{ ref('stg_concepts') }}
)

SELECT 
    concept_id,
    concept_name,
    domain_id,
    vocabulary_id,
    concept_class_id,
    standard_concept,
    concept_code,
    valid_start_date,
    valid_end_date,
    invalid_reason
    
FROM stg_concepts
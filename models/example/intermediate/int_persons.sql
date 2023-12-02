{{ 
    config(
        materialized='view'
        ) 
}}

WITH stg_persons AS (
    SELECT * FROM {{ ref('stg_persons') }}
)

SELECT 
    person_id,
    year_of_birth,
    month_of_birth,
    day_of_birth,
    birth_datetime,
    location_id,
    provider_id,
    care_site_id,
    race_concept_id,
    ethnicity_concept_id,
    person_source_value,
    gender_source_value,
    race_source_value,
    race_source_concept_id,
    ethnicity_source_value,
    ethnicity_source_concept_id,
    gender_concept_id,
    
FROM stg_persons
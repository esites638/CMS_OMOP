{{ 
    config(
        materialized='view'
        ) 
}}

WITH stg_care_sites AS (
    SELECT * FROM {{ ref('stg_care_sites') }}
)

SELECT 
        care_site_id,
        care_site_name,
        place_of_service_concept_id,
        location_id,
        care_site_source_value,
        place_of_service_source_value
    
FROM stg_care_sites
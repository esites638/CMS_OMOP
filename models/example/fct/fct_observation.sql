{{ 
    config(
        materialized='incremental',
        on_schema_change='fail'
        ) 
}}

WITH stg_observations AS (
    SELECT * FROM {{ ref('stg_observations')}}
)

SELECT * FROM stg_observations
WHERE observation_date IS NOT NULL
{% if is_incremental() %}
  and observation_datetime > (select max(observation_date) from {{ this }})
{% endif %}

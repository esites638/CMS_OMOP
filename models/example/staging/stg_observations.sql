with source as (
    select * from {{ source('dbt_bq_public_datasets', 'observation') }}
),

stg_observations AS (
    SELECT 
        {{ adapter.quote("observation_id") }},
        {{ adapter.quote("person_id") }},
        {{ adapter.quote("observation_concept_id") }},
        {{ adapter.quote("observation_date") }},
        {{ adapter.quote("observation_datetime") }},
        {{ adapter.quote("observation_type_concept_id") }},
        {{ adapter.quote("value_as_number") }},
        {{ adapter.quote("value_as_string") }},
        {{ adapter.quote("value_as_concept_id") }},
        {{ adapter.quote("qualifier_concept_id") }},
        {{ adapter.quote("unit_concept_id") }},
        {{ adapter.quote("provider_id") }},
        {{ adapter.quote("visit_occurrence_id") }},
        {{ adapter.quote("visit_detail_id") }},
        {{ adapter.quote("observation_source_value") }},
        {{ adapter.quote("observation_source_concept_id") }},
        {{ adapter.quote("unit_source_value") }},
        {{ adapter.quote("qualifier_source_value") }}
    FROM source
)

SELECT * FROM stg_observations
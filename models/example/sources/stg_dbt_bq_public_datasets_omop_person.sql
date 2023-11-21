with source as (
    select * from {{ source('dbt_bq_public_datasets', 'person') }}
),

renamed as (
    select 
        {{ adapter.quote("race_concept_id") }},
        {{ adapter.quote("ethnicity_concept_id") }},
        {{ adapter.quote("location_id") }},
        {{ adapter.quote("provider_id") }},
        {{ adapter.quote("care_site_id") }},
        {{ adapter.quote("person_source_value") }},
        {{ adapter.quote("gender_source_value") }},
        {{ adapter.quote("gender_source_concept_id") }},
        {{ adapter.quote("race_source_value") }},
        {{ adapter.quote("race_source_concept_id") }},
        {{ adapter.quote("ethnicity_source_value") }},
        {{ adapter.quote("ethnicity_source_concept_id") }},
        {{ adapter.quote("person_id") }},
        {{ adapter.quote("gender_concept_id") }},
        {{ adapter.quote("year_of_birth") }},
        {{ adapter.quote("month_of_birth") }},
        {{ adapter.quote("day_of_birth") }},
        {{ adapter.quote("birth_datetime") }}

    from source

)

select * from renamed
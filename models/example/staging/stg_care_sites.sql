with source as (
    select * from {{ source('dbt_bq_public_datasets', 'care_site') }}
),

stg_care_sites as (
    select 
        {{ adapter.quote("care_site_id") }},
        {{ adapter.quote("care_site_name") }},
        {{ adapter.quote("place_of_service_concept_id") }},
        {{ adapter.quote("location_id") }},
        {{ adapter.quote("care_site_source_value") }},
        {{ adapter.quote("place_of_service_source_value") }}


    from source

)

select * from stg_care_sites
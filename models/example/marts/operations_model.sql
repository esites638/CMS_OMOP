WITH

p AS (
    SELECT *
    FROM {{ ref('int_persons')}}
),

c AS (
    SELECT * 
    FROM {{ ref('int_care_sites')}}
),

co AS (
    SELECT * 
    FROM {{ ref('int_concepts')}}
),


ob AS (
    SELECT *
    FROM {{ ref('int_observations')}}
)

SELECT 
    p.person_id,
    p.year_of_birth,
    p.month_of_birth,
    p.day_of_birth,
    p.birth_datetime,
    p.care_site_id,
    p.race_concept_id,
    p.ethnicity_concept_id,
    p.person_source_value,
    p.gender_source_value,
    p.race_source_value,
    p.race_source_concept_id,
    p.ethnicity_source_value,
    p.ethnicity_source_concept_id,
    p.gender_concept_id,
    c.care_site_name,
    c.place_of_service_concept_id,
    c.location_id,
    c.care_site_source_value,
    c.place_of_service_source_value, 
    co.concept_id,
    co.concept_name,
    co.domain_id,
    co.vocabulary_id,
    co.concept_class_id,
    co.standard_concept,
    co.concept_code,
    co.valid_start_date,
    co.valid_end_date,
    co.invalid_reason,
    ob.observation_id,
    ob.observation_concept_id,
    ob.observation_date,
    ob.observation_datetime,
    ob.observation_type_concept_id,
    ob.value_as_number,
    ob.value_as_string,
    ob.value_as_concept_id,
    ob.qualifier_concept_id,
    ob.unit_concept_id,
    ob.provider_id,
    ob.visit_occurrence_id,
    ob.visit_detail_id,
    ob.observation_source_value,
    ob.observation_source_concept_id,
    ob.unit_source_value,
    ob.qualifier_source_value
FROM p
LEFT JOIN c ON (p.care_site_id = c.care_site_id)
LEFT JOIN ob ON (p.person_id = ob.person_id)
LEFT JOIN co ON (ob.observation_concept_id = co.concept_id)
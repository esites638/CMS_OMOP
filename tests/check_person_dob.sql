SELECT * 
FROM {{ ref('int_persons')}}
WHERE day_of_birth < 1
LIMIT 10
with source as (
    select *
    from {{ ref('state') }}
),
stage_state as (
    select 
        state_code,
        state_name
    from source
)
select *
from stage_state

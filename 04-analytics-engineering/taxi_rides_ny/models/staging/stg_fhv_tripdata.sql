{{
    config(
        materialized='view'
    )
}}


with tripdata as
(

    select *
     from {{ source('staging', 'fhv_tripdata') }}
    where dispatching_base_num is not null
)
select
    {{ dbt_utils.generate_surrogate_key(['dispatching_base_num', 'affiliated_base_number', 'pickup_datetime'])}} as tripid,
    cast(pickup_datetime as timestamp) as pickup_datetime_ts,
    cast(dropoff_datetime as timestamp) as dropoff_datetime_ts,
    pulocationid,
    dolocationid,
    sr_flag,
    affiliated_base_number
from tripdata
where pickup_datetime between '2019-01-01' and '2019-12-31'

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}

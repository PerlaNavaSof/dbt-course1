{{ config(
        materialized='incremental', 
        unique_key= 'timeincremental',
        tags=['daily'] ) }}

select concat(T_HOUR, ':', T_MINUTE, ':', T_SECOND) as timeincremental
from "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."TIME_DIM"
where timeincremental >= current_time

{% if is_incremental() %}
    and timeincremental > (select max(timeincremental) from {{this}})
{% endif %}
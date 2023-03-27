{{ config(materialized='incremental', unique_key= 'd_date') }}

select *
from "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."DATE_DIM"
where d_date <= current_date

-- which records we want to include on incremental run
--DBT has include a macro that looks like this

{% if is_incremental() %}
    and d_date > (select max(d_date) from {{this}})
{% endif %}



select
    O_ORDERDATE,  
    sum(O_TOTALPRICE) as comulative,
    sum(comulative) over (order by O_ORDERDATE) results_cumulative
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"
group by O_ORDERDATE
ORDER BY O_ORDERDATE asc
with orders as(
    select *
    from {{ source('sample','orders')}}
)


select
    O_ORDERDATE,  
    sum(O_TOTALPRICE) over (order by O_ORDERDATE) as results_cumulative
from orders

{% if target.name == 'dev' %}
    where year(O_ORDERDATE)= 1996
{% endif %}

order by O_ORDERDATE
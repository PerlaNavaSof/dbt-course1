with sample_customer as(
    select *
    from {{ source('sample','customer')}}
),

sample_order as(
    select *
    from {{ source('sample','orders')}}
)

select 
    c.c_custkey,
    c.c_name,
    c.c_nationkey as nation,
    sum(o.o_totalprice) as total_order_price
from sample_customer c
left join sample_order o
on c.C_CUSTKEY=o.O_CUSTKEY

{{group_by(3)}}
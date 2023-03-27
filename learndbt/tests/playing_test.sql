select sum(case when C_CUSTKEY is null then 1 else 0 end) / count(C_ACCTBAL) as total
from {{ref('playing_with_test')}}
where C_MKTSEGMENT in ('BUILDING', 'MACHINERY', 'AUTOMOBILE', 'HOUSEHOLD', 'FURNITURE')
having sum(case when C_CUSTKEY is null then 1 else 0 end) / count(C_ACCTBAL) < 100000000
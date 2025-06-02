with apple_count as
(
    select 
        sale_date
        , coalesce(sum(sold_num),0) as apple_cnt
    from 
        Sales
    group by sale_date, fruit
    having fruit = 'apples'
)
, oranges_count as
(
    select 
        sale_date
        , coalesce(sum(sold_num),0) as orange_cnt
    from 
        Sales
    group by sale_date, fruit
    having fruit = 'oranges'
)
select 
    a.sale_date
    , (a.apple_cnt - o.orange_cnt) as diff
from 
    apple_count a join oranges_count o on a.sale_date = o.sale_date
select course, dept,
    case when sum(case when status in ( 'fail','detained') then 1 else 0 end) > 0 then 'fail'
         when sum(case when status in ('absent') then 1 else 0 end) > 0 then 'absent'
         when sum(case when status in ('pass') then 1 else 0 end) > 0 then 'pass'
         else 'no_result'
    end as final_status
from college
group by course,dept
Select customer_id , Count(*) as count_no_trans 
from Visits V left join Transactions T
on V.visit_id = T.visit_id 
Where T.visit_id is null
Group by customer_id
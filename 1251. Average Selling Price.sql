Select P.product_id , ISNULL(ROUND(SUM(P.price * U.units * 1.0) / NULLIF(SUM(U.units), 0.00), 2), 0.00) 'average_price'
from Prices P left join UnitsSold U
on P.product_id = U.product_id 
Where U.purchase_date BETWEEN P.start_date AND P.end_date or U.purchase_date is null
Group by P.product_id
Select customer_id 
From Customer C, Product P
Group by customer_id
having count(Distinct C.product_key) = (Select count(*) From Product)

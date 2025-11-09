Select P.product_name  , S.year , S.price 
from Sales S, Product P
Where S.product_id = P.product_id 
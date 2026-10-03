Select class     
from  (
Select class , count(student ) 'students'
from Courses  
Group by class     
) as x
where students >=5

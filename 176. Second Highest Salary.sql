Select Max(Salary) 'SecondHighestSalary'
from Employee
where Salary != (Select Max(Salary)from Employee)
Select 
    Format(trans_date, 'yyyy-MM') AS month,
    country,
    Count(*) AS trans_count,
    IsNull(Sum(Case When state = 'approved' Then 1 end), 0) as approved_count,
    IsNull(Sum(amount), 0) as trans_total_amount,
    IsNull(Sum(Case When state = 'approved' Then amount end), 0) as approved_total_amount
From Transactions
Group by FORMAT(trans_date, 'yyyy-MM'), country
Order by month, country;

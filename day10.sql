-- Analytical Functions 

-- First Value 

--Q Get the first value of the balance column 
select *, 
        first_value(balance) over (order by balance desc) as firstvalue 
from accounts;

--Q Give the first value of every account type.
select *, 
       first_value(balance) over (partition by account_type order by balance asc) as firstvalue 
from accounts;


-- Last Value 

--Q Get the last value acc to the balance column 
select *, 
        last_value(balance) over (order by balance range between unbounded preceding and unbounded following)
        as lastvalue 
from accounts; 


-- Lead 

--Q Next value of the balance column 
select *, 
        lead(balance) over (order by balance) as lead_1 
from accounts; 

--Q Next value of balance column acc to the account type 
select *, 
        lead(balance) over (partition by account_type order by balance) as lead_2 
from accounts; 


-- Lag 

--Q Previous value of the balance column 
select *, 
        lag(balance) over (order by balance) as lag_1 
from accounts; 

--Q Previous value of the balance column acc to account type 
select *, 
        lag(balance) over (partition by account_type order by balance) as lag_2 
from accounts; 

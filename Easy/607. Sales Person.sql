-- Table: SalesPerson

-- +-----------------+---------+
-- | Column Name     | Type    |
-- +-----------------+---------+
-- | sales_id        | int     |
-- | name            | varchar |
-- | salary          | int     |
-- | commission_rate | int     |
-- | hire_date       | date    |
-- +-----------------+---------+
-- sales_id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the name and the ID of a salesperson alongside their salary, commission rate, and hire date.
 

-- Table: Company

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | com_id      | int     |
-- | name        | varchar |
-- | city        | varchar |
-- +-------------+---------+
-- com_id is the primary key (column with unique values) for this table.
-- Each row of this table indicates the name and the ID of a company and the city in which the company is located.
 

-- Table: Orders

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | order_id    | int  |
-- | order_date  | date |
-- | com_id      | int  |
-- | sales_id    | int  |
-- | amount      | int  |
-- +-------------+------+



with cte as
(select sales_id 
from Orders o 
left join Company c
on o.com_id = c.com_id
where c.name like 'RED')

select name 
from SalesPerson
where sales_id not in(select distinct sales_id from cte)

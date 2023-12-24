-- INDEX & VIEWS
-- Describe a table
describe customers;

-- Creating Index (faster execution of query- returns less no of rows after execution)
create index check_no_index
on payments(checkNumber);

-- Explain does the job of describing the query
Explain 
select *
from payments
where checkNumber='BO864823';
drop index check_no_index on payments;

-- Shows the intormation about the indexes created on each column
show indexes from  payments;

-- Create unique index (Say if one has not placed a constraint as unique one can put it while defining an index)
create unique index cust_no_index
on payments(customerNumber);


-- View (used for selectively creating a view of a Master table visible to the client)
-- View is a virtual table where no actual data is stored.
create View Customer_USA
as
Select customerNumber,customerName,state,country
from customers
where country="USA";

select *
from customer_usa;

-- create a view of Top 10 customers with respect to creditLimit
create View Top10_Customers
as
Select customerNumber,customerName,creditLimit
from customers
order by creditLimit desc
limit 10;

select *
from Top10_Customers;

-- Create a view territory_status mentioning no of employees in each territory
create View territory_status
as
Select count(employeeNumber) as "CNT",territory
from employees inner join offices using(officeCode)
group by territory
order by "CNT" desc;

-- Alter a view
Alter View Customer_USA
as
Select customerNumber,customerName,state,country,city
from customers
where country="USA";




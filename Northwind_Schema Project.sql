-- Create a report that shows the CategoryName and Description from the categories table sorted by CategoryName.
select CategoryName, Description from categories
 order by CategoryName; 
 
 -- Create a report that shows the ContactName, CompanyName, ContactTitle and Phone number from the customers table sorted by Phone.
 select ContactName, CompanyName, ContactTitle, Phone from customers
 order by Phone;
 --  Create a report that shows the capitalized FirstName and capitalized LastName renamed as FirstName and Lastname respectively and HireDate from the employees table sorted from the newest to the oldest employee.
select upper(FirstName) as FirstName, upper(LastName) as LastName, HireDate from employees
order by HireDate desc;

-- Create a report that shows the top 10 OrderID, OrderDate, ShippedDate, CustomerID, Freight from the orders table sortedby Freight in descending order.
select OrderID,  OrderDate, ShippedDate, CustomerID, Freight from orders
order by Freight desc limit 10;

-- Create a report that shows all the CustomerID in lowercase letter and renamed as ID from the customers table.
select lower(CustomerID) as ID 
FROM  customers;

-- Create a report that shows the CompanyName, Fax, Phone, Country, HomePage from the suppliers table sorted by the Country in descending order then by CompanyName in ascending order.
select CompanyName, Fax, Phone, Country, HomePage from suppliers
order by Country desc;

 select CompanyName, Fax, Phone, Country, HomePage from suppliers
order by  CompanyName asc;

-- Create a report that shows CompanyName, ContactName of all customers from ‘Buenos Aires' only
select CompanyName, ContactName from customers where City = 'Buenos Aires';

-- Create a report showing ProductName, UnitPrice, QuantityPerUnit of products that are out of stock.
select  ProductName, UnitPrice, QuantityPerUnit from products
where UnitsInStock = 0;

-- Create a report showing all the ContactName, Address, City of all customers not from Germany, Mexico, Spain.
select  ContactName, Address, City from customers
where country not in ('Germany', 'Mexico', 'Spain');

-- Create a report showing OrderDate, ShippedDate, CustomerID, Freight of all orders placed on 21 May 1996.
select  OrderDate, ShippedDate, CustomerID, Freight from orders
where OrderDate =   '1996-05-21';

-- . Create a report showing FirstName, LastName, Country from the employees not from United States.
select FirstName, LastName, Country from employees
where Country <>  'USA';

-- Create a report that shows the EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from all orders shipped later than the required date
select EmployeeID, OrderID, CustomerID, RequiredDate, ShippedDate from orders
where ShippedDate > RequiredDate;

-- 13. Create a report that shows the City, CompanyName, ContactName of customers from cities starting with A or B.
select City, CompanyName, ContactName from customers 
where City like 'A%' or City like 'B%';

-- Create a report showing all the even numbers of OrderID from the orders table
SELECT OrderID
FROM Orders
WHERE OrderID % 2 = 0;

-- Create a report that shows all the orders where the freight cost more than $500.
select OrderID from orders 
where Freight > '500';

-- . Create a report that shows the ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel of all products that are up for reorder
select ProductName, UnitsInStock, UnitsOnOrder, ReorderLevel
from  products
where UnitsInStock + UnitsOnOrder <= ReorderLevel;

-- Create a report that shows the CompanyName, ContactName number of all customer that have no fax number.
select CompanyName, ContactName from customers
where fax is null;

-- Create a report that shows the FirstName, LastName of all employees that do not report to anybody.
select FirstName, LastName from employees
where ReportsTo is null;

--  Create a report showing all the odd numbers of OrderID from the orders table
select OrderID from orders 
where OrderID % 2 = 1;

-- . Create a report that shows the CompanyName, ContactName, Fax of all customers that do not have Fax number and sorted by ContactName.
select CompanyName, ContactName, Fax from customers
where fax is null 
order by ContactName;

-- Create a report that shows the City, CompanyName, ContactName of customers from cities that has letter L in the name sorted by ContactName
select City, CompanyName, ContactName from customers
where City like '%L%'
order by ContactName ;

-- Create a report that shows the FirstName, LastName, BirthDate of employees born in the 1950s.
select FirstName, LastName, BirthDate from employees
where BirthDate  BETWEEN '1950-01-01' AND '1959-12-31';

-- Create a report that shows the FirstName, LastName, the year of Birthdate as birth year from the employees table.
select FirstName, LastName, YEAR(Birthdate) as BirthYear 
from employees;

-- Create a report showing OrderID, total number of Order ID as NumberofOrders from the orderdetails table grouped by OrderID and sorted by NumberofOrders in descending order
select OrderID, count(OrderID) as NumberOfOrders
from orderdetails
group by OrderID
order by NumberOfOrders desc;

-- Create a report that shows the SupplierID, ProductName, CompanyName from all product Supplied by Exotic Liquids, Specialty Biscuits, Ltd., Escargots Nouveaux sorted by the supplier ID
select p.SupplierID, p.ProductName, s.CompanyName from products p
join suppliers s on p.SupplierID = s.SupplierID
where CompanyName in  ('Exotic Liquids', 'Specialty Biscuits, Ltd.', 'Escargots Nouveaux')
order by p.SupplierID;

-- Create a report that shows the ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress of all orders with ShipPostalCode beginning with "98124"
select ShipPostalCode, OrderID, OrderDate, RequiredDate, ShippedDate, ShipAddress from orders
where ShipPostalCode like '98124%';

-- . Create a report that shows the ContactName, ContactTitle, CompanyName of customers that the has no "Sales" in their ContactTitle.
select ContactName, ContactTitle, CompanyName from customers
where ContactTitle not like ('%sales%');

-- Create a report that shows the LastName, FirstName, City of employees in cities other "Seattle"
select LastName, FirstName, City from employees
where City not like ('%Seattle%');
--  Create a report that shows the CompanyName, ContactTitle, City, Country of all customers in any city in Mexico or other cities in Spain other than Madrid.
select CompanyName, ContactTitle, City, Country from customers
where (Country = 'Mexico') or ( Country ='Spain' and city <> 'Madrid');

--  Create a select statement that outputs the following:
select LastName, FirstName, 'can be reached at ',  Extension
from employees as ContactInfo ;

-- Create a report that shows the ContactName of all customers that do not have letter A as the second alphabet in their Contactname.
SELECT ContactName FROM Customers
WHERE SUBSTRING(ContactName, 2, 1) <> 'A';
-- introduced subsstring

-- . Create a report that shows the average UnitPrice rounded to the next whole number, total price of UnitsInStock and maximum number of orders from the products table. All saved as AveragePrice, TotalStock and MaxOrder respectively.
SELECT ROUND(AVG(UnitPrice), 0) AS AveragePrice,
       SUM(UnitPrice * UnitsInStock) AS TotalStock,
       MAX(UnitsOnOrder) AS MaxOrder
FROM Products;
-- introduced round, avg, max. 

-- . Create a report that shows the SupplierID, CompanyName, CategoryName, ProductName and UnitPrice from the products, suppliers and categories table.
SELECT p.SupplierID, s.CompanyName, c.CategoryName, p.ProductName, p.UnitPrice
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
JOIN Categories c ON p.CategoryID = c.CategoryID;
-- introduced join for more than two tables 

-- Create a report that shows the CustomerID, sum of Freight, from the orders table with sum of freight greater $200, grouped by CustomerID. HINT: you will need to use a Groupby and a Having statement.
SELECT CustomerID, SUM(Freight) AS TotalFreight
FROM Orders
GROUP BY CustomerID
HAVING SUM(Freight) > 200;
-- introduced having

-- . Create a report that shows the OrderID ContactName, UnitPrice, Quantity, Discount from the order details, orders and customers table with discount given on every purchase
SELECT o.OrderID, c.ContactName, od.UnitPrice, od.Quantity, od.Discount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
join  orderdetails od  on o.OrderID = od.OrderID
WHERE od.Discount <> 0;

--  Create a report that shows the EmployeeID, the LastName and FirstName as employee, and the LastName and FirstName of who they report to as manager from the employees table sorted by Employee ID. HINT: This is a SelfJoin
select 
    e.employeeid,
    e.lastname as employeelastname,
    e.firstname as employeefirstname,
    m.lastname as managerlastname,
    m.firstname as managerfirstname
from 
    employees e
    inner join employees m on e.reportsto = m.employeeid
order by 
    e.employeeid;
-- involved inner join 

-- Create a report that shows the average, minimum and maximum UnitPrice of all products as AveragePrice, MinimumPrice and MaximumPrice respectively  
select avg(UnitPrice) as AveragePrice,
min(UnitPrice) as MinimumPrice, max(UnitPrice) as MaximumPrice
from products;

--  Create a view named CustomerInfo that shows the CustomerID, CompanyName, ContactName, ContactTitle, Address, City, Country, Phone, OrderDate, RequiredDate, ShippedDate from the customers and orders table. HINT: Create a View.
create view CustomerInfo as 
select c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle, c.Address, c.City, c.Country, c.Phone, o.OrderDate, o.RequiredDate, o.ShippedDate
from customers c 
join orders o on c.CustomerID = o.CustomerID;
-- introduced create view

--  Change the name of the view you created from customerinfo to customer details.
drop view CustomerInfo;
create view CustomerDetails as
select c.CustomerID, c.CompanyName, c.ContactName, c.ContactTitle, c.Address, c.City, c.Country, c.Phone, o.OrderDate, o.RequiredDate, o.ShippedDate
from customers c 
join orders o on c.CustomerID = o.CustomerID;
-- introduced rename view. 

-- Create a view named ProductDetails that shows the ProductID, CompanyName, ProductName, CategoryName, Description, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued from the supplier, products and categories tables. HINT: Create a View
create view ProductDetails as 
select p.ProductID, s.CompanyName, p.ProductName, c.CategoryName, c.Description, p.QuantityPerUnit, p.UnitPrice, p.UnitsInStock, p.UnitsOnOrder, p.ReorderLevel, p.Discontinued
from products p 
join suppliers s on p.SupplierID = s.SupplierID
join categories c on p.CategoryID = c.CategoryID;

-- Drop the customer details view.
drop view customerdetails

-- Create a report that fetch the first 5 character of categoryName from the category tables and renamed as ShortInfo
select substring(CategoryName, 1, 5) as  ShortInfo
from categories;
-- introduced substring function

-- . Create a copy of the shipper table as shippers_duplicate. Then insert a copy of shippers data into the new table HINT: Create a Table, use the LIKE Statement and INSERT INTO statement. 
create table shippers_duplicate like shippers;
insert into shippers_duplicate
select * from shippers;
-- introduced create duplicate table and insert

-- Create a select statement that outputs the following from the shippers_duplicate Table
select ShipperID, CompanyName, Phone
from shippers_duplicate;

--  Create a report that shows the CompanyName and ProductName from all product in the Seafood category.
select s.CompanyName, p.ProductName
from products p
join categories c on p.CategoryID = c.CategoryID
join suppliers s on p.SupplierID = s.SupplierID
where 	c.CategoryName = 'Seafood';

-- Create a report that shows the CategoryID, CompanyName and ProductName from all product in the categoryID 5.
select c.CategoryID, s.CompanyName, p.ProductName
from products p
join categories c on p.CategoryID = c.CategoryID
join suppliers s on p.SupplierID = s.SupplierID
where c.CategoryID = 5;

-- Delete the shippers_duplicate table
drop table shippers_duplicate;

--  Create a select statement that ouputs the following from the employees table. NB: The age might differ depending on the year you are attempting this query.
select FirstName, LastName, Title, YEAR(CURRENT_DATE()) - YEAR(birthdate) AS age
from employees;

-- Create a report that the CompanyName and total number of orders by customer renamed as number of orders since Decemeber 31, 1994. Show number of Orders greater than 10.
SELECT CompanyName, COUNT(OrderID) AS `Number of Orders`
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE OrderDate >= '1995-01-01'
GROUP BY CompanyName
HAVING COUNT(OrderID) > 10;

-- Create a select statement that ouputs the following from the product table NB: It should return 77rows
select ProductName as ProductInfo, QuantityPerUnit, 'and',  'cost', ceiling(UnitPrice) as rounded_price
from products;
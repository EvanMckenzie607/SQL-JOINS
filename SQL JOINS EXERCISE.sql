/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name AS ProductName, C.Name
FROM products AS P
INNER JOIN categories AS C 
ON C.CategoryID = P.CategoryID
WHERE C.Name = "Computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT P.NAME, P.Price, R.Rating FROM Products AS P
INNER JOIN Reviews AS R 
ON R.ProductID = P.ProductID
WHERE R.Rating = 5;

 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT E.FirstName, E.LastName, Sum(S.Quantity) AS Total FROM sales AS S
INNER JOIN employees AS E 
ON E.EmployeeID = S.EmployeeID
GROUP BY E.EmployeeID
ORDER BY Total Desc
LIMIT 2;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT D.Name AS "Department Name", c.Name AS "Category Name" 
FROM departments AS D
INNER JOIN categories AS C 
ON C.DepartmentID = D.DepartmentID
WHERE C.Name = "Appliances" OR C.Name = "Games";
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT P.Name, SUM(S.Quantity) AS "Total Sold",
SUM(S.Quantity = S.PricePerUnit) AS "Total Price"
FROM products AS P
INNER JOIN sales AS S
ON S.ProductID = P.ProductID
WHERE P.ProductID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT P.Name, R.Reviewer, MIN(R.Rating)
FROM products AS P
INNER JOIN reviews AS R 
ON R.ProductID = P.ProductID
WHERE P.ProductID = 857 
GROUP BY P.ProductID;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT E.EmployeeID, E.FirstName, P.Name, SUM(S.Quantity) AS TotalSold
FROM Sales AS S 
INNER JOIN employees AS E
ON E.EmployeeID = S.EmployeeID
INNER JOIN products AS P
ON P.ProductID = S.ProductID
GROUP BY E.EmployeeID, P.ProductID;
create database Super_Store_Sales_data;
Use Super_Store_Sales_Data;
Select * from superstore_sales_dataset;


                            #Sales Performance Analysis Using SQL

#What is the total sales and profit per region?
SELECT Region, 
       SUM(Sales) AS Total_Sales, 
       SUM(Profit) AS Total_Profit
FROM SuperStore_sales_dataset
GROUP BY Region
ORDER BY Total_Sales DESC;

#Which are the top 10 most profitable products?
SELECT "Product Name", 
       SUM(Profit) AS Total_Profit
FROM SuperStore_Sales_Dataset
GROUP BY "Product Name"
ORDER BY Total_Profit DESC
LIMIT 10;


#What is the monthly trend of sales?
SELECT DATE_FORMAT(STR_TO_DATE(`Order Date`, '%d-%m-%Y'), '%Y-%m') AS Month,
       SUM(Sales) AS Monthly_Sales
FROM SuperStore_Sales_Dataset
GROUP BY Month
ORDER BY Month;





#Which customer segments are the most sales and  most profitable?
SELECT Segment, 
       SUM(Sales) AS Total_Sales, 
       SUM(Profit) AS Total_Profit
FROM superstore_sales_dataset
GROUP BY Segment;


#Top 5 Cities by Sales
SELECT City, 
       SUM(Sales) AS Total_Sales, 
       SUM(Profit) AS Total_Profit
FROM superstore_sales_dataset
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;

#Total Orders per Ship Mode
SELECT `Ship Mode`, 
       COUNT(DISTINCT "Order ID") AS Total_Orders
FROM superstore_sales_dataset
GROUP BY `Ship Mode`
ORDER BY Total_Orders DESC;

#Top 5 Customers by Total Purchase
SELECT `Customer Name`, 
       SUM(Sales) AS Total_Sales, 
       SUM(Profit) AS Total_Profit
FROM superstore_sales_dataset
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 5;

#Sales by Product Category and Sub-Category
SELECT Category, 
       `Sub-Category`, 
       SUM(Sales) AS Total_Sales, 
       SUM(Profit) AS Total_Profit
FROM superstore_sales_dataset
GROUP BY Category, `Sub-Category`
ORDER BY Total_Sales DESC;

#Average Profit Margin by Category
SELECT Category,
       ROUND(SUM(Profit) / SUM(Sales), 2) AS Avg_Profit_Margin
FROM superstore_sales_dataset
GROUP BY Category
ORDER BY Avg_Profit_Margin DESC;

#Products with Negative Profit (Loss-Making)
SELECT `Product Name`, 
       SUM(Profit) AS Total_Profit
FROM superstore_sales_dataset
GROUP BY `Product Name`
HAVING Total_Profit < 0
ORDER BY Total_Profit asc;

#Year-over-Year Sales Comparison
SELECT 
  YEAR(STR_TO_DATE(`Order Date`, '%d-%m-%Y')) AS Year,
  SUM(Sales) AS Yearly_Sales
FROM superstore_sales_dataset
GROUP BY Year
ORDER BY Year;


#Sales and Profit by Payment Mode
SELECT `Payment Mode`,
       SUM(CAST(Sales AS FLOAT)) AS Total_Sales,
       SUM(CAST(Profit AS FLOAT)) AS Total_Profit
FROM superstore_sales_dataset
GROUP BY `Payment Mode`;




#Average Delivery Time (in Days)
SELECT AVG(DATEDIFF(`Ship Date`, `Order Date`)) AS Avg_Delivery_Days
FROM superstore_sales_dataset
WHERE `Order Date` IS NOT NULL AND `Ship Date` IS NOT NULL;


# Most Frequently Ordered Products
SELECT `Product Name`, 
       COUNT(*) AS Order_Count, 
       SUM(Quantity) AS Total_Quantity
FROM superstore_sales_dataset
GROUP BY `Product Name`
ORDER BY Order_Count DESC
LIMIT 10;

# Monthly Sales Trend
SELECT 
    DATE_FORMAT(STR_TO_DATE(`Order Date`, '%d-%m-%Y'), '%Y-%m') AS Order_Month,
    SUM(Sales) AS Monthly_Sales
FROM superstore_sales_dataset
GROUP BY Order_Month
ORDER BY Order_Month;


# Total Revenue (Sales)
SELECT ROUND(SUM(Sales), 2) AS Total_Revenue
FROM superstore_sales_dataset;


#Total Profit
SELECT ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore_sales_dataset;

#. Profit Margin per Category
SELECT Category,
       ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0), 2) AS Profit_Margin
FROM superstore_sales_dataset
GROUP BY Category;



#State-wise Sales and Profit
SELECT State,
       ROUND(SUM(Sales), 2) AS Total_Sales,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore_sales_dataset
GROUP BY State
ORDER BY Total_Profit DESC;    


#Quantity Sold by Product
SELECT `Product Name`,
       SUM(Quantity) AS Total_Quantity_Sold
FROM superstore_sales_dataset
GROUP BY `Product Name`
ORDER BY Total_Quantity_Sold DESC
LIMIT 10;

# Most Profitable Customers
SELECT `Customer ID`, `Customer Name`,
       ROUND(SUM(Profit), 2) AS Total_Profit
FROM superstore_sales_dataset
GROUP BY `Customer ID`, `Customer Name`
ORDER BY Total_Profit DESC
LIMIT 10;

#Best and Worst Performing Categories by Profit Margin
SELECT Category,
       ROUND(SUM(Profit), 2) AS Total_Profit,
       ROUND(SUM(Profit)/NULLIF(SUM(Sales), 0), 2) AS Profit_Margin
FROM superstore_sales_dataset
GROUP BY Category
ORDER BY Profit_Margin DESC;


#Orders with Highest Quantity
SELECT `Order ID`, `Product Name`, Quantity, Sales
FROM superstore_sales_dataset
ORDER BY Quantity DESC
LIMIT 10;




#Number of Orders per Region
SELECT Region, COUNT(DISTINCT `Order ID`) AS Total_Orders
FROM superstore_sales_dataset
GROUP BY Region
ORDER BY Total_Orders DESC;

# First and Last Purchase Date per Customer
SELECT `Customer ID`, `Customer Name`,
       MIN(`Order Date`) AS First_Purchase,
       MAX(`Order Date`) AS Last_Purchase
FROM superstore_sales_dataset
GROUP BY `Customer ID`, `Customer Name`;

#Most Frequently Ordered Product
SELECT `Product Name`, COUNT(*) AS Order_Count
FROM superstore_sales_dataset
GROUP BY `Product Name`
ORDER BY Order_Count DESC
LIMIT 1;



#Number of Orders with Profit Less Than Zero (instead of Discount Applied)
SELECT COUNT(DISTINCT `Order ID`) AS Loss_Orders
FROM superstore_sales_dataset
WHERE Profit < 0;

#Customers Who Purchased More Than 100 Items Total
SELECT `Customer ID`, `Customer Name`, SUM(Quantity) AS Total_Quantity
FROM superstore_sales_dataset
GROUP BY `Customer ID`, `Customer Name`
HAVING Total_Quantity > 100
ORDER BY Total_Quantity DESC;


#Number of Unique Products Sold in Each Category
SELECT Category, COUNT(DISTINCT `Product Name`) AS Unique_Products
FROM superstore_sales_dataset
GROUP BY Category;

#Top 5 Products by Quantity Sold per Region
SELECT Region, `Product Name`, SUM(Quantity) AS Total_Quantity
FROM superstore_sales_dataset
GROUP BY Region, `Product Name`
ORDER BY Region, Total_Quantity Desc;




#Earliest and Latest Order Date in the Dataset
SELECT MIN(`Order Date`) AS First_Order, MAX(`Order Date`) AS Last_Order
FROM superstore_sales_dataset;

#Number of Unique Cities per Region
SELECT Region, COUNT(DISTINCT City) AS City_Count
FROM superstore_sales_dataset
GROUP BY Region
ORDER BY City_Count DESC;

# Count of Products Sold Only Once
SELECT `Product Name`, COUNT(*) AS Sale_Count
FROM superstore_sales_dataset
GROUP BY `Product Name`
HAVING Sale_Count = 1;  



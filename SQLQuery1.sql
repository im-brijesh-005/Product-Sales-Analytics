WITH cte AS(
SELECT
a.Product,
a.Category,
a.Brand,
a.Description,
a.Sale_Price,
a.Cost_Price,
a.Image_url,
b.Date,
b.Customer_Type,
b.Discount_Band,
b.Units_Sold,
(Sale_Price*Units_Sold) AS revenue,
FORMAT(date,'MMMM') AS month,
FORMAT(date,'yyyy') AS year
FROM product_data a
JOIN product_sales b
ON a.Product_ID = b.Product)

SELECT *,
(1-Discount*1.0/100)*revenue AS discount_revenue
FROM cte a
JOIN discount_data b
ON a.Discount_Band = b.Discount_Band
AND
a.month = b.Month


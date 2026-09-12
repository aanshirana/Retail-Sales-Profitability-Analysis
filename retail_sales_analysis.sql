-- Retail Sales & Profitability Analysis
-- Tool: Google BigQuery
-- Analysis: Sales, profitability, regional performance,
-- customer segments, discounts and product-level performance


-- 1. Overall Business KPIs
SELECT
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit,
  COUNT(DISTINCT `Order ID`) AS total_orders,
  ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_pct
FROM `businessanalyst-portfolio-2026.retail_analysis.superstore`;


-- 2. Regional Sales and Profitability
SELECT
  Region,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit,
  ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_pct
FROM `businessanalyst-portfolio-2026.retail_analysis.superstore`
GROUP BY Region
ORDER BY total_sales DESC;


-- 3. Category Performance
SELECT
  Category,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit,
  ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_pct
FROM `businessanalyst-portfolio-2026.retail_analysis.superstore`
GROUP BY Category
ORDER BY total_sales DESC;


-- 4. Sub-Category Profitability
SELECT
  `Sub-Category`,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit
FROM `businessanalyst-portfolio-2026.retail_analysis.superstore`
GROUP BY `Sub-Category`
ORDER BY total_profit DESC;


-- 5. Customer Segment Performance
SELECT
  Segment,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit
FROM `businessanalyst-portfolio-2026.retail_analysis.superstore`
GROUP BY Segment
ORDER BY total_sales DESC;


-- 6. Yearly Sales and Profit Trend
SELECT
  EXTRACT(YEAR FROM `Order Date`) AS order_year,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit
FROM `businessanalyst-portfolio-2026.retail_analysis.superstore`
GROUP BY order_year
ORDER BY order_year;


-- 7. Discount Impact on Profitability
SELECT
  Discount,
  COUNT(*) AS number_of_orders,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit
FROM `businessanalyst-portfolio-2026.retail_analysis.superstore`
GROUP BY Discount
ORDER BY Discount;


-- 8. Product-Level Profitability
SELECT
  `Product Name`,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit
FROM `businessanalyst-portfolio-2026.retail_analysis.superstore`
GROUP BY `Product Name`
ORDER BY total_profit DESC;

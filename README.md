# Olist-E-Commerce-Strategic-Sales-Logistics-Overview-Analysis
Olist E-Commerce: Strategic Sales &amp; Logistics Overview Analysis Transforming 100,000+ Raw E-Commerce Records into Actionable Business Intelligence.  Using the real-world Olist dataset (Brazilian e-commerce), I simulated a full analyst workflow—from raw database querying to executive-level dashboarding.

📌 Project Overview
This project is an end-to-end data analytics solution designed to uncover operational insights for Olist, a major Brazilian e-commerce department store.

The goal was to transform a complex, real-world relational database (100k+ orders) into a strategic dashboard that answers two critical business questions:

Sales Performance: How is revenue trending, and which products/regions are driving growth?

Logistics Efficiency: Where are the supply chain bottlenecks, and how does delivery speed impact the customer experience?

🗂️ Data Source & Architecture
The dataset consists of 9 normalized tables representing the full e-commerce lifecycle: Orders, Items, Customers, Payments, Products, Reviews, Sellers, Geolocation, and Category Translations.

Key Data challenges addressed:

High Normalization: Data was scattered across multiple tables, requiring complex joins to create a usable analytical dataset.

Data Integrity: Handling null values in delivery dates and inconsistent state codes.

Language Barrier: Translating product categories from Portuguese to English for international analysis.

🛠️ Tech Stack & Methodology
1. Data Engineering & Transformation (SQL)
Instead of importing raw, heavy tables directly into the visualization tool, SQL (SQLite) was used as the primary ETL (Extract, Transform, Load) engine. This approach ensured that the data model remained lightweight and performant.

Data Denormalization: Executed complex multi-table JOINs to merge Customer, Order, and Item data into a single "Enriched Orders" dataset. This allowed for granular analysis at the order-item level without row duplication errors.

Feature Engineering:

Calculated Delivery Lead Time (Order Date vs. Delivery Date).

Calculated Estimated vs. Actual delivery gaps to measure logistical accuracy.

Data Cleaning: Filtered out 'canceled' and 'unavailable' orders to ensure revenue metrics reflected only realized sales.

Aggregation: Pre-aggregated heavy datasets (like monthly sales trends) using SQL GROUP BY and COUNT functions to speed up dashboard rendering.

2. Data Visualization & Modeling (Power BI)
The processed data was ingested into Power BI to build an interactive, multi-page report.

Data Modeling: Established a Star Schema within Power BI, where necessary to connect the main fact table (Orders Enriched) with dimension tables (Geolocation, Time).

DAX Measures:

% On-Time Delivery: A custom measure logic created to calculate the percentage of orders delivered before the promised date.

Average Order Value (AOV): Dynamic calculation of revenue per unique order.

Interactivity: Implemented global slicers for Time (Date Range) and Geography (State), allowing users to drill down from a national view to specific regional performance.

📊 Dashboard Structure
Page 1: Sales Overview (The "Growth" View)
KPI Cards: Headlines for Total Revenue, Total Orders, and Average Order Value.

Trend Analysis: A Line Chart visualizing the revenue trajectory from 2016 to 2018, highlighting seasonality (e.g., Black Friday spikes).

Geographic Distribution: A Bubble Map visualizing revenue concentration, clearly showing the dominance of the South-East region (São Paulo/Rio).

Category Analysis: A Bar Chart ranking the top revenue-generating categories (e.g., Health & Beauty, Bed Bath Table).

Page 2: Logistics & Operations (The "Efficiency" View)
Delivery Speed KPI: Tracks the average days taken to deliver a package.

Regional Bottlenecks: A Bar Chart comparing delivery times across states, revealing significant delays in Northern states (Amazonas, Amapá) vs. the South.

Freight vs. Price: A scatter analysis or insight box understanding the correlation between shipping costs and product value.

Payment Preferences: A breakdown of how customers pay (Credit Card vs. Boleto) across different regions.

💡 Key Business Insights
Logistical Disparity: There is a massive gap in delivery times. Customers in São Paulo receive items in ~8 days, while customers in northern states (like AP, AM) wait 25+ days.

Conservative Estimates: Olist tends to over-estimate delivery dates by an average of 10+ days. While this manages expectations, it may deter customers looking for speed.

Revenue Drivers: While "Bed Bath & Table" sells the highest volume of items, categories like "Watches" and "Computers" drive higher profit margins due to larger basket sizes.

📂 Repository Structure
SQL_Queries/: Contains the .sql scripts used for data cleaning, joining, and aggregation.

Datasets/: The processed CSV files generated from SQL (orders_enriched.csv, state_performance.csv, etc.).

Dashboard/: The Power BI (.pbix) file containing the final report.

Docs/: Project summary and problem statement.

🚀 How to Run This Project
Database: Load the raw Olist datasets into any SQL environment (SQLite/MySQL).

ETL: Run the scripts in the SQL_Queries folder to generate the enriched CSVs.

Dashboard: Open the .pbix file in Power BI Desktop.

Note: You may need to repoint the data source to your local folder path.

Author: Dipansu 
Connect with me on LinkedIn - https://www.linkedin.com/in/dipanshu-370464203/
[dashboard pdf.pdf](https://github.com/user-attachments/files/24416160/dashboard.pdf.pdf)

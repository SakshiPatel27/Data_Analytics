# Blinkit Grocery Sales Database Project

## Overview
This SQL project contains analysis of Blinkit grocery store sales data. The project includes detailed product information, inventory tracking, and sales metrics across various grocery categories and product types.

## Database Structure

### Tables

#### 1. **grocery_sales**
Contains comprehensive grocery product and sales data.

**Columns:**
- `item_identifier` - Unique product identifier
- `item_type` - Category of product (Food, Beverages, Household, etc.)
- `item_weight` - Weight of the product
- `item_fat_content` - Fat content classification (Low Fat, Regular)
- `item_mrp` - Maximum Retail Price
- `item_outlet_sales` - Sales amount at outlet
- `outlet_identifier` - Store/outlet reference
- `outlet_establishment_year` - Year outlet was established
- `outlet_size` - Size of outlet (Small, Medium, High)
- `outlet_location_type` - Location classification (Tier 1, 2, 3)
- `outlet_type` - Type of store (Grocery Store, Supermarket, etc.)

## Data Files
- `Blinkit.sql` - SQL script with database creation and analysis queries
- Additional grocery sales data

## Key Queries Included

### 1. **Data Exploration**
```sql
-- View all grocery sales data
SELECT * FROM grocery_sales;
```

### 2. **Product Analysis**
- Show all unique item identifiers
- Count total number of products
- Maximum item weight
- Minimum item weight
- Average item weight
- Products by weight range

### 3. **Fat Content Analysis**
- Count of low-fat products
- Count of regular-fat products
- Fat content distribution
- Low-fat vs regular sales comparison

### 4. **Pricing Analysis**
- Maximum item MRP
- Minimum item MRP
- Average MRP by category
- Products with MRP > 200
- Price range distributions

### 5. **Sales Performance**
- Total sales by product
- Total sales by outlet
- Sales by item type
- Sales by outlet size
- Sales by outlet location type

## Business Insights

### Product Categories
- Multiple product types (Food, Household, Beverages, etc.)
- Diverse price points (budget to premium)
- Mix of high and low-fat products
- Weight variations across categories

### Outlet Performance
- Different outlet sizes and types
- Tier-based location analysis (Tier 1, 2, 3 cities)
- Establishment year impact on sales
- Store type performance comparison

### Customer Preferences
- Fat content preferences by region
- Price sensitivity analysis
- Popular weight ranges
- Category-wise demand patterns

## Use Cases

1. **Inventory Management** - Optimize stock levels by product and outlet
2. **Pricing Strategy** - Analyze pricing impact on sales volume
3. **Product Performance** - Identify best and worst performing products
4. **Outlet Optimization** - Compare outlet performance and identify improvements
5. **Category Analysis** - Understand category-wise profitability
6. **Demand Forecasting** - Predict sales trends by season and location
7. **Market Segmentation** - Segment by outlet type, location, and size

## Sample Analytics

### Queries to Try
- **Best selling products:**
```sql
SELECT item_identifier, item_type, SUM(item_outlet_sales) as total_sales
FROM grocery_sales
GROUP BY item_identifier, item_type
ORDER BY total_sales DESC
LIMIT 10;
```

- **Sales by item type:**
```sql
SELECT item_type, COUNT(*) as product_count, AVG(item_outlet_sales) as avg_sales
FROM grocery_sales
GROUP BY item_type
ORDER BY avg_sales DESC;
```

- **Fat content impact on sales:**
```sql
SELECT item_fat_content, COUNT(*) as count, AVG(item_outlet_sales) as avg_sales
FROM grocery_sales
GROUP BY item_fat_content;
```

- **Outlet performance analysis:**
```sql
SELECT outlet_identifier, outlet_size, outlet_type, SUM(item_outlet_sales) as total_sales
FROM grocery_sales
GROUP BY outlet_identifier, outlet_size, outlet_type
ORDER BY total_sales DESC;
```

- **MRP impact on sales:**
```sql
SELECT 
    CASE 
        WHEN item_mrp < 100 THEN 'Budget'
        WHEN item_mrp < 200 THEN 'Mid-range'
        ELSE 'Premium'
    END as price_segment,
    COUNT(*) as products,
    AVG(item_outlet_sales) as avg_sales
FROM grocery_sales
GROUP BY price_segment;
```

## Performance Metrics
- Average item weight distribution
- Sales variance across outlets
- Price elasticity by category
- Customer acquisition by outlet type
- Repeat purchase patterns

## Prerequisites
- MySQL or compatible SQL database
- CSV import capability
- SQL query execution environment

## Setup Instructions
1. Create the Blinkit database using the SQL script
2. Create the grocery_sales table with appropriate schema
3. Import sales data from CSV
4. Build indexes on key columns
5. Run analysis queries

## Optimization Recommendations
- Index on item_type and outlet_type for frequent queries
- Partition data by year for historical analysis
- Create views for common sales reports
- Aggregate tables for dashboard queries
- Regular data archival for old transactions

---

**Last Updated**: August 2026  
**Database Type**: MySQL  
**Data Focus**: Grocery Retail Sales Analysis

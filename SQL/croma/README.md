# Croma Electronics Database Project

## Overview
This SQL project contains a comprehensive database of electronics and computer products sold at Croma. The project includes product information, manufacturer details, and pricing data for various IT and electronics categories.

## Database Structure

### Tables

#### 1. **Products**
Contains electronics and computer product information.

**Columns:**
- `Product_code` - Unique product identifier (INT, 5 digits)
- `Product_name` - Name/description of the product (VARCHAR, 50 chars)
- `Product_price` - Selling price of the product (INT, 7 digits)
- `Manufacturer_code` - Reference to manufacturer (INT, 5 digits)

**Sample Products:**
- Storage Devices: Hard Disk Drive, SSD, Pen Drives
- Peripherals: Mouse, Keyboard, Webcam, Speakers
- Components: RAM, Graphics Card, Motherboard, Power Supply
- Display: Monitor, Television
- Accessories: Monitor Arm Stand, Printer Cartridges, Wifi Adapter
- Furniture: Ergonomic Chair, Laptop Stand

#### 2. **Manufacturers**
Contains manufacturer information and details.

**Columns:**
- `Manufacturer_code` - Unique manufacturer identifier (INT, 5 digits)
- `Manufacturer_name` - Name of the manufacturer (VARCHAR, 50 chars)

**Sample Manufacturers:**
- Western Digital
- Samsung
- Hewlett Packard
- Corsair
- Asus
- And many more...

## Data Files
- `croma.sql` - SQL script with database creation, table definition, and sample data
- Complete schema with 20+ sample products

## Product Categories

### Storage Devices
- Hard Disk Drives (HDD)
- Solid State Drives (SSD)
- Pen Drives/USB Storage

### Computing Components
- RAM (Memory)
- Graphics Cards
- Motherboards
- CPU Cabinets
- Power Supply Units

### Peripherals & Accessories
- Keyboards (Membrane, Mechanical)
- Mice
- Webcams (HD)
- Speakers (Bluetooth)
- Wifi Adapters

### Display & Entertainment
- Monitors (22", various sizes)
- Television (42" & larger)
- Monitor Arm Stands

### Furniture & Ergonomics
- Ergonomic Chairs
- Laptop Adjustable Stands
- Monitor Arm Stands

### Office Equipment
- Printers
- Printer Cartridges

## Key Queries Included

### 1. **Basic Product Queries**
- Show all products with details
- List all product names
- Show all manufacturers
- Product count by manufacturer

### 2. **Pricing Analysis**
- Maximum product price
- Minimum product price
- Average price by category
- Price distribution
- Premium vs budget products

### 3. **Manufacturer Analysis**
- Products by manufacturer
- Top manufacturers by product count
- Manufacturer market share

### 4. **Category-wise Analysis**
- Storage devices inventory
- Component availability
- Peripheral products
- Display products

## Business Insights

### Product Portfolio
- Comprehensive range from budget to premium products
- Diverse manufacturer partnerships
- Multiple product categories
- Accessories for complete solutions

### Pricing Strategy
- Budget items: ₹300-₹1,000 (Wifi Adapter, Mouse)
- Mid-range: ₹1,000-₹4,200 (Storage, RAM, Peripherals)
- Premium: ₹6,500-₹24,600 (Monitors, TV, Graphics Cards)
- Complete system solutions available

### Manufacturer Distribution
- Multiple manufacturers per category
- Brand diversity for customer choice
- Established brands (Samsung, HP, Western Digital)
- Specialized component manufacturers

## Use Cases

1. **Inventory Management** - Track product stock and reorder points
2. **Pricing Optimization** - Analyze price positioning against competitors
3. **Manufacturer Relationships** - Monitor supplier performance
4. **Sales Analysis** - Identify best-selling products and categories
5. **Bundle Creation** - Create product bundles for system solutions
6. **Customer Segmentation** - Target customers by budget and needs
7. **Category Performance** - Track category-wise profitability
8. **Stock Management** - Optimize inventory turnover

## Sample Analytics

### Queries to Try
- **All products with manufacturer names:**
```sql
SELECT p.Product_code, p.Product_name, p.Product_price, m.Manufacturer_name
FROM Products p
JOIN Manufacturers m ON p.Manufacturer_code = m.Manufacturer_code
ORDER BY p.Product_price DESC;
```

- **Products by price range:**
```sql
SELECT 
    CASE 
        WHEN Product_price < 1000 THEN 'Budget'
        WHEN Product_price < 5000 THEN 'Mid-range'
        ELSE 'Premium'
    END as price_segment,
    COUNT(*) as product_count,
    AVG(Product_price) as avg_price
FROM Products
GROUP BY price_segment;
```

- **Manufacturer with most products:**
```sql
SELECT m.Manufacturer_name, COUNT(p.Product_code) as product_count, AVG(p.Product_price) as avg_price
FROM Products p
JOIN Manufacturers m ON p.Manufacturer_code = m.Manufacturer_code
GROUP BY m.Manufacturer_name
ORDER BY product_count DESC;
```

- **Storage devices inventory:**
```sql
SELECT Product_code, Product_name, Product_price
FROM Products
WHERE Product_name LIKE '%Hard Disk%' OR Product_name LIKE '%SSD%' OR Product_name LIKE '%Pen Drive%'
ORDER BY Product_price;
```

- **Component vs Peripheral pricing:**
```sql
SELECT 
    'Components' as type,
    AVG(Product_price) as avg_price
FROM Products
WHERE Product_name LIKE '%RAM%' OR Product_name LIKE '%Card%' OR Product_name LIKE '%Motherboard%'
UNION ALL
SELECT 
    'Peripherals',
    AVG(Product_price)
FROM Products
WHERE Product_name LIKE '%Mouse%' OR Product_name LIKE '%Keyboard%' OR Product_name LIKE '%Webcam%';
```

## Database Statistics
- **Total Products**: 20+ (expandable)
- **Total Manufacturers**: 10+ (expandable)
- **Price Range**: ₹300 - ₹24,600
- **Average Product Price**: ₹5,500

## Prerequisites
- MySQL or compatible SQL database
- SQL client or command line access
- Basic understanding of relational databases

## Setup Instructions
1. Create the Croma database
2. Run the SQL script to create tables
3. Insert sample data using provided INSERT statements
4. Verify data integrity
5. Run test queries

## Extension Possibilities
- Add stock quantity table
- Track sales transactions
- Manage supplier details
- Track customer reviews/ratings
- Inventory movement history
- Warranty information
- Product specifications

---

**Last Updated**: August 2026  
**Database Type**: MySQL  
**Industry**: Electronics Retail
**Data Scope**: Sample Educational Database

# Airbnb Database Project

## Overview
This SQL project contains a comprehensive analysis of Airbnb listings and booking data. The project includes two main tables: `listings` containing host and property information, and `booking_details` containing reservation and pricing information.

## Database Structure

### Tables

#### 1. **listings**
Contains information about Airbnb listings and hosts.

**Columns:**
- `listing_id` - Unique identifier for each listing
- `host_id` - Unique identifier for the host
- `host_name` - Name of the host
- `neighbourhood_group` - Geographic group (e.g., Brooklyn, Manhattan)
- `neighbourhood` - Specific neighborhood
- `room_type` - Type of room (Entire home, Private room, Shared room)
- `name` - Title/name of the listing
- Additional listing details (coordinates, availability, etc.)

#### 2. **booking_details**
Contains reservation and pricing information.

**Columns:**
- `booking_id` - Unique booking identifier
- `listing_id` - Reference to listing
- `booking_date` - Date of booking
- `price` - Price of the booking
- `number_of_nights` - Duration of stay
- Additional booking metrics

## Data Files
- `Airbnb.sql` - SQL script with database creation and analysis queries
- `Listings.csv` - Raw listings data
- `Booking_Details.csv` - Raw booking details data

## Key Queries Included

### 1. **Data Exploration**
```sql
-- Show all listings and booking details
SELECT * FROM listings;
SELECT * FROM booking_details;
```

### 2. **Listings Analysis**
- Show all listing names
- Count total listings
- Fetch all unique hosts
- Find unique neighborhood groups
- Find unique neighborhoods
- Find unique room types

### 3. **Geographic Filtering**
- Show listings in Brooklyn and Manhattan neighborhoods
- Filter by specific geographic areas

### 4. **Pricing Analysis**
- Maximum price from bookings
- Minimum price from bookings
- Average pricing by neighborhood
- Price ranges by room type

### 5. **Host Analysis**
- Total unique hosts
- Hosts by neighborhood
- Top performing hosts

## Business Insights

### Geographic Distribution
- Data covers multiple neighborhood groups (Brooklyn, Manhattan, etc.)
- Multiple neighborhoods provide granular geographic analysis
- Different pricing patterns by region

### Room Types
- Entire homes/apartments
- Private rooms
- Shared rooms
- Each type has distinct pricing characteristics

### Pricing Patterns
- Price variations across neighborhoods
- Seasonal booking patterns
- Room type impact on pricing
- Length of stay correlations

## Use Cases

1. **Market Analysis** - Understand Airbnb market dynamics in different neighborhoods
2. **Host Performance** - Identify top-performing hosts and listings
3. **Pricing Strategy** - Analyze pricing patterns to optimize rates
4. **Occupancy Analysis** - Calculate occupancy rates and booking frequency
5. **Customer Segmentation** - Segment customers by booking patterns
6. **Revenue Analysis** - Calculate total revenue by host, neighborhood, or room type

## Sample Analytics

### Queries to Try
- **Total listings by neighborhood group:**
```sql
SELECT neighbourhood_group, COUNT(*) as total_listings
FROM listings
GROUP BY neighbourhood_group;
```

- **Average price by room type:**
```sql
SELECT room_type, AVG(price) as avg_price
FROM booking_details bd
JOIN listings l ON bd.listing_id = l.listing_id
GROUP BY room_type;
```

- **Host with most listings:**
```sql
SELECT host_name, COUNT(*) as listing_count
FROM listings
GROUP BY host_name
ORDER BY listing_count DESC
LIMIT 10;
```

- **Price statistics:**
```sql
SELECT 
    MIN(price) as min_price,
    MAX(price) as max_price,
    AVG(price) as avg_price,
    STDDEV(price) as std_deviation
FROM booking_details;
```

## Prerequisites
- MySQL or compatible SQL database
- Access to upload CSV files
- Basic SQL knowledge

## Setup Instructions
1. Create the Airbnb database using the SQL script
2. Import Listings.csv into the listings table
3. Import Booking_Details.csv into the booking_details table
4. Run the analysis queries as needed

## Performance Optimization Tips
- Add indexes on frequently searched columns (listing_id, host_id, neighbourhood_group)
- Partition data by year for large datasets
- Use views for common query patterns
- Consider denormalization for reporting queries

---

**Last Updated**: August 2026  
**Database Type**: MySQL  
**Data Status**: Sample/Educational Dataset

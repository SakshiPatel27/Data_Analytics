# Zomato Restaurants Analysis Dashboard

## Overview
This Tableau dashboard provides comprehensive analysis of Zomato restaurants across various Indian cities. The analysis includes restaurant distribution, ratings, pricing, customer voting patterns, and cuisine preferences.

## Key Metrics

| Metric | Value |
|--------|-------|
| **Average Cost** | ₹1,103 |
| **Total Votes** | 7,87,337 |
| **Total Restaurants** | 6,593 |
| **Average Ratings** | 4.088/5.0 |

## Dashboard Components

### 1. **Geographic Analysis**

#### City-wise Average Cost
- **Bangalore**: ₹1,019 (Highest)
- **Delhi**: ₹734
- **Mumbai**: ₹727
- **Kolkata**: ₹712
- **Hyderabad**: ₹589 (Lowest)

#### City-wise Average Ratings
- **Gurgaon**: 4.31 ⭐ (Highest)
- **Agra**: 4.24 ⭐
- **Ahmedabad**: 4.20 ⭐
- **Noida**: 4.19 ⭐
- **Mumbai**: 4.18 ⭐

### 2. **Restaurant Distribution by City**
The bar chart shows average costs across major cities:
- Gurgaon, Delhi, Goa, Noida, Ghaziabad, and Agra
- Gurgaon has the highest average cost among analyzed cities
- Agra shows the lowest average cost in this subset

### 3. **Top-Rated Restaurants**
Five restaurants maintain a perfect 5.0 rating:
- 10-11 Kit... (possibly "10-11 Kitchen")
- 125 Gms
- 1989 Pizz... (possibly "1989 Pizza")
- @The BBQ
- @49

### 4. **Restaurant Brand Distribution**

#### Top Restaurant Chains
The donut/pie chart reveals the most popular restaurant brands:
- **Wow! Momo**: 67 outlets
- **Kanti Sweets**: 65 outlets
- **Barbeque Nation**: 48 outlets
- **Taco Bell**: 44 outlets
- **Mad Over Donuts**: 29 outlets
- **Frozen Bottle**: 28 outlets
- **Dindigul Thalappakatti**: 33 outlets

### 5. **Bubble Chart Analysis - Restaurant Popularity**
The bubble visualization shows restaurant chains by outlet count:
- **Barbeque Nation**: 13 outlets (Largest bubble)
- **Taco Bell**: 12 outlets
- **The Chocolate Room**: 9 outlets
- **Spice It**: 9 outlets
- **Subway**: 9 outlets
- **Punjab Grill**: 7 outlets
- **ABs**: 7 outlets
- **Mamamoto**: 8 outlets
- **Mainland**: 8 outlets
- **Lord of the**: 6 outlets

### 6. **Cuisine Type Preferences**

#### Cuisine Distribution (Treemap)
- **North Indian & Chinese**: 294 restaurants (Dominant)
- **Fast Food**: 167 restaurants
- **North Indian**: 150 restaurants
- **North Indian, Chinese & Continental**: 146 restaurants
- **North Indian, Chinese & Fast Food**: 76 restaurants

#### Key Insights
- North Indian cuisine dominates the Zomato platform
- Chinese-Indian fusion is highly popular (combined North Indian & Chinese: 440+ restaurants)
- Fast food has significant presence as both standalone and combined cuisines
- Continental and fusion cuisines represent a growing segment

## Data Sources
- **File**: `Zomato_dashboard-preview.png` (Dashboard visualization)
- **Raw Data**: `1759923004033-Zomato (1).xlsx` (Excel file)
- **Dashboard File**: `zomato.twbx` (Tableau workbook)

## Analysis Insights

### Pricing Insights
- Bangalore has the most premium restaurant market with average cost of ₹1,103
- Hyderabad offers the most affordable dining options at ₹589 average cost
- Gurgaon leads in ratings (4.31) despite moderate pricing

### Market Trends
1. **Restaurant Chains**: Established chains like Barbeque Nation and Taco Bell have strong presence
2. **Cuisine Preferences**: North Indian cuisine has the largest market share
3. **Quality Indicators**: Average platform rating of 4.088 indicates good restaurant quality
4. **Customer Engagement**: 7.87 lakh votes demonstrate active customer base

### Geographic Preferences
- **Major Cities**: Delhi and Mumbai are well-represented despite moderate pricing
- **Premium Markets**: Bangalore and Gurgaon show higher cost but maintain excellent ratings
- **Emerging Markets**: Hyderabad shows affordable pricing with competitive ratings

## Use Cases
This dashboard can be used for:
- Restaurant selection based on city and cuisine preferences
- Market analysis for restaurant entrepreneurs
- Pricing strategy benchmarking
- Identifying high-performing restaurant brands
- Understanding regional cuisine preferences
- Customer satisfaction analysis through ratings

## Files Included
- `README.md` - This documentation file
- `zomato.twbx` - Interactive Tableau dashboard
- `1759923004033-Zomato (1).xlsx` - Raw data file
- `Zomato_dashboard-preview.png` - Dashboard preview image
- `~zomato__16188.twbr` - Tableau backup/recovery file

---

**Last Updated**: August 2026  
**Data Source**: Zomato Restaurant Database  
**Visualization Tool**: Tableau

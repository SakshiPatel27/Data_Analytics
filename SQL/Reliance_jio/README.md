# Reliance Jio Employee Database Project

## Overview
This SQL project contains a comprehensive human resources database for Reliance Jio organization. The project includes employee information, departmental structure, salary management, and organizational hierarchy.

## Database Structure

### Tables

#### 1. **Employee**
Contains employee information and department assignments.

**Columns:**
- `Emp_ID` - Unique employee identifier (10 digits)
- `First_Name` - Employee's first name (VARCHAR, 10 chars)
- `Last_Name` - Employee's last name (VARCHAR, 10 chars)
- `Dept_Code` - Department code (references Department table)

**Sample Data:**
- 20+ employees with Indian names
- Multiple department assignments
- Complete employee roster

#### 2. **Department**
Contains departmental information and budget allocation.

**Columns:**
- `Dept_Code` - Unique department identifier (10 digits)
- `Dept_Name` - Name of the department (VARCHAR, 25 chars)
- `Dept_Budget` - Annual departmental budget (INT, 12 digits)

**Sample Departments:**
- Sales and Marketing: ₹50,000,000
- Information Technology: ₹100,000,000
- Customer Service: ₹30,000,000
- Human Resources
- Operations
- Finance

## Data Files
- `Reliance_Jio.sql` - SQL script with database creation and sample data
- Complete employee and department information

## Organizational Structure

### Departments Overview

#### 1. **Sales and Marketing** (Dept Code: 23)
- **Budget**: ₹50 million
- **Employees**: Multiple sales and marketing professionals
- **Focus**: Customer acquisition and brand management

#### 2. **Information Technology** (Dept Code: 66)
- **Budget**: ₹100 million (Largest)
- **Employees**: Software developers, systems engineers
- **Focus**: Technology infrastructure and development

#### 3. **Customer Service** (Dept Code: 43)
- **Budget**: ₹30 million
- **Employees**: Customer support representatives
- **Focus**: Customer satisfaction and support

#### 4. **Other Departments**
- Human Resources
- Operations
- Finance
- Legal
- And more...

## Key Queries Included

### 1. **Employee Queries**
- Show all employees
- Count total employees
- Find employees by department
- Show employees by first/last name
- Find employees by Emp_ID

### 2. **Departmental Analysis**
- List all departments
- Total employees per department
- Budget allocation per employee
- Department headcount

### 3. **Organizational Analysis**
- Organization structure overview
- Employee distribution across departments
- Department hierarchy

### 4. **Budget Analysis**
- Total organizational budget
- Budget by department
- Cost per employee by department
- Budget-to-employee ratio

## Business Insights

### Organizational Distribution
- **IT Department**: Highest budget allocation (₹100M)
- **Sales & Marketing**: ₹50M for customer acquisition
- **Customer Service**: ₹30M for support operations
- **Total Budget**: ₹180M+ across visible departments

### Employee Distribution
- Employees spread across multiple departments
- IT and Customer Service have higher headcount
- Sales and Marketing focused team
- Mix of functional expertise

### Budget-to-Employee Ratio
- **IT**: Premium budget allocation per employee
- **Sales & Marketing**: Competitive budget for revenue generation
- **Customer Service**: Efficient cost structure for support

## Use Cases

1. **HR Analytics** - Employee distribution and headcount planning
2. **Budget Planning** - Department budget allocation and optimization
3. **Organizational Design** - Analyze department structure and efficiency
4. **Talent Management** - Track employee assignments and roles
5. **Cost Analysis** - Calculate cost per employee and ROI by department
6. **Resource Planning** - Allocate resources based on headcount
7. **Performance Management** - Link employees to departments for evaluation
8. **Succession Planning** - Identify key roles and backup plans

## Sample Analytics

### Queries to Try
- **Employee count by department:**
```sql
SELECT d.Dept_Name, COUNT(e.Emp_ID) as employee_count, d.Dept_Budget
FROM Department d
LEFT JOIN Employee e ON d.Dept_Code = e.Dept_Code
GROUP BY d.Dept_Code, d.Dept_Name, d.Dept_Budget
ORDER BY employee_count DESC;
```

- **Budget per employee:**
```sql
SELECT d.Dept_Name, d.Dept_Budget, COUNT(e.Emp_ID) as employee_count,
       ROUND(d.Dept_Budget / COUNT(e.Emp_ID), 2) as budget_per_employee
FROM Department d
LEFT JOIN Employee e ON d.Dept_Code = e.Dept_Code
GROUP BY d.Dept_Code, d.Dept_Name, d.Dept_Budget
ORDER BY budget_per_employee DESC;
```

- **All employees with department details:**
```sql
SELECT e.Emp_ID, CONCAT(e.First_Name, ' ', e.Last_Name) as full_name,
       d.Dept_Name, d.Dept_Budget
FROM Employee e
JOIN Department d ON e.Dept_Code = d.Dept_Code
ORDER BY d.Dept_Name, e.Last_Name;
```

- **Total organizational budget and headcount:**
```sql
SELECT COUNT(DISTINCT e.Emp_ID) as total_employees,
       SUM(d.Dept_Budget) as total_budget,
       ROUND(SUM(d.Dept_Budget) / COUNT(DISTINCT e.Emp_ID), 2) as avg_budget_per_employee
FROM Employee e
JOIN Department d ON e.Dept_Code = d.Dept_Code;
```

- **Top paying departments:**
```sql
SELECT d.Dept_Name, d.Dept_Budget
FROM Department d
ORDER BY d.Dept_Budget DESC
LIMIT 10;
```

- **Departments with most employees:**
```sql
SELECT d.Dept_Name, COUNT(e.Emp_ID) as employee_count
FROM Department d
LEFT JOIN Employee e ON d.Dept_Code = e.Dept_Code
GROUP BY d.Dept_Code, d.Dept_Name
ORDER BY employee_count DESC;
```

## Organizational Metrics

### Key Statistics
- **Total Employees**: 20+
- **Total Departments**: 6+
- **Total Budget**: ₹180+ million
- **Average Budget per Department**: ~₹30-40 million

### Department Efficiency
- IT: Highest budget investment
- Sales & Marketing: Revenue-generating focus
- Customer Service: Operations support
- HR/Finance: Administrative functions

## Prerequisites
- MySQL or compatible SQL database
- Database creation privileges
- SQL query execution capability
- Basic HR knowledge

## Setup Instructions
1. Create the Reliance Jio database
2. Execute the SQL script to create tables
3. Insert employee and department data
4. Verify data relationships
5. Run analysis queries

## Extension Possibilities
- Add employee salary details
- Track employee assignments and roles
- Manage promotions and transfers
- Performance evaluation records
- Training and development records
- Leave and attendance tracking
- Project assignments

## Future Enhancements
- Link to salary/compensation data
- Add manager-employee relationships
- Track employee career progression
- Performance ratings
- Skill inventory
- Project allocation

---

**Last Updated**: August 2026  
**Database Type**: MySQL  
**Organization**: Reliance Jio  
**Focus**: Human Resources Management

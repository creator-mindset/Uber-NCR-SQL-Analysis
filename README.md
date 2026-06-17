# 🚖 Uber NCR Ride Booking SQL Analysis
![Image Description](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQzJegEVHXv-MIVuNoQLXPz-zpcYRyhfaM7TwZFGe7ZA&s)
## 📌 Project Overview

This project focuses on analyzing Uber NCR ride booking data using SQL. The objective is to extract meaningful business insights from ride booking records and answer real-world business questions related to revenue, customer behavior, vehicle performance, cancellations, and payment preferences.

The analysis demonstrates the practical application of SQL concepts such as:

* Data Filtering
* Aggregations
* Group By Operations
* Common Table Expressions (CTEs)
* Window Functions
* Business KPI Analysis

---

### Dataset
Dataset link:https://www.kaggle.com/datasets/nidhisharma25/uber-ride-bookings-ncr-2024/data
## 📊 Dataset Information

The dataset contains ride booking information including:

* Date
* Time
* Booking ID
* Booking Status
* Customer ID
* Vehicle Type
* Pickup Location
* Drop Location
* Avg VTAT
* Avg CTAT
* Cancelled Rides by Customer
* Reason for cancelling by Customer
* Cancelled Rides by Driver
* Driver Cancellation Reason
* Incomplete Rides
* Incomplete Rides Reason
* Booking Value
* Ride Distance
* Driver Ratings
* Customer Rating
* Payment Method

---

## 🎯 Project Objectives

* Analyze ride booking trends.
* Identify revenue-generating segments.
* Study customer booking behavior.
* Evaluate vehicle performance.
* Investigate cancellation patterns.
* Generate actionable business insights.

---

## 🔍 Business Questions Solved

### Revenue Analysis

* Total revenue generated is ₹76244386.7646
* Top 5 revenue generating routes are (Nirman Vihar-Vatika Chowk,New Delhi Railway Station-Rajouri Garden,Cyber Hub-Gurgaon Railway Station,Ashok Vihar-Basai Dhankot and Model Town-Jahangirpuri)
* Saturday has highest demand with 462 rides
* November recorded maximum rides

### Customer Analysis

* 99.1920 % are repeated customers
* Top 3 customers spend Rs4987,Rs4722,Rs4277 on rides

### Vehicle Analysis

* Auto completed 23115 rides
* Uber XL has the lowest cancellation rate

### Cancellation Analysis

* Haus Khas-New Colony has highest cancellation rate with 100% cancellation
* Morning hour( 5 a.m.) face most cancellations with 26.42 %

### Payment Analysis

* UPI payment method is most popular with 93909 bookings
* UPI contributes the highest revenue by total revenue of Rs 47743304.76470195
---

## 🛠 SQL Concepts Used

### Aggregate Functions

* SUM()
* AVG()
* COUNT()

### Window Functions

* DENSE_RANK()
* OVER()

### Common Table Expressions (CTEs)

* WITH


### Conditional Functions

* CASE WHEN

### SQL Clauses
* GROUP BY
* ORDER BY
* LIMIT
* WHERE
* DISTINCT
* 

---

## 📈 Key Insights

* Identified the most profitable vehicle category.
* Determined peak demand periods.
* Analyzed customer booking patterns.
* Evaluated cancellation behavior across ride categories.
* Measured payment method preferences.
* Ranked customers based on ride frequency and spending.

---

## 🚀 Tools Used

* MySQL Workbench
* SQL


---

## 📚 Learning Outcomes

Through this project, I strengthened my understanding of:

* Writing complex SQL queries
* Solving business problems using data
* Working with large datasets
* Using Window Functions and CTEs
* Extracting actionable business insights

---

### ⭐ If you found this project useful, feel free to star the repository.

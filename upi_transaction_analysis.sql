-- 1. Basic Analysis

-- 1. What is the total number of UPI transactions?
 select count(*) as Total_transactions from upi_transactions;
 
 -- 2. What is the total transaction amount?
 select sum(Transaction_Amount) as Total_Amount from upi_transactions;
 
 -- 3. What is the average transaction amount?
 select avg(Transaction_Amount) as average_Amount from upi_transactions;
 
 -- 4. What is the maximum transaction amount?
 select Max(Transaction_Amount) as Maximum_Amount from upi_transactions;
 
 -- 5. What is the minimum transaction amount?
select min(Transaction_Amount) as Minimum_Amount from upi_transactions;

-- Business Insight:
-- These metrics provide an overview of overall UPI transaction
-- volume, transaction value, and average transaction size.

-- 2. Unique Analysis
-- 6. How many unique cities are available in the dataset?
select count(distinct City) as unique_cities from upi_transactions;

-- 7. Which banks are available in the dataset?
select Distinct Bank_Name from upi_transactions;

-- Business Insight:
-- The dataset covers multiple cities and banks,
-- helping analyze UPI transaction patterns across different locations and banks.

-- 3. Transaction Status Analysis
-- 8. How many transactions are successful and failed?
select Transaction_Status,count(*) as Total from upi_transactions group by Transaction_Status;

-- 9. What is the total number of successful transactions?
select count(*) from upi_transactions where Transaction_Status="Success";

-- 10. What is the total number of failed transactions?
select count(*) from upi_transactions where Transaction_Status="Failed";

-- Business Insights:
-- 1. Successful transactions account for 88.3% of total transactions.
-- 2. Failed transactions account for 7.7% of total transactions.
-- 3. The majority of UPI transactions are completed successfully.

-- 4. City Wise Analysis

-- 11. How many transactions were performed in each city?
select City,count(*) as Total_Transactions from upi_Transactions group by City order by Total_Transactions desc;

-- 12. What is the total transaction amount for each city?
select City,sum(Transaction_Amount) as Total_Amount from upi_transactions group by City order by Total_Amount desc;

-- 13. Which are the top 5 cities based on transaction volume?
select City,count(*) as Total_transaction from upi_transactions group by City order by Total_transaction desc limit 5;

-- Business Insights:
-- 1. Mumbai has the highest transaction volume.
-- 2. City-wise analysis helps identify high-performing locations.
-- 3. Top 5 cities contribute significantly to overall transaction activity.

-- 5. Bank Wise Analysis

-- 14. How many transactions were performed through each bank?
select Bank_Name,count(*) as total_transaction from upi_transactions group by Bank_Name;

-- 15. What is the total transaction amount for each bank?
select Bank_Name,sum(Transaction_Amount) as Total_Amount from upi_transactions group by Bank_Name;

-- 16. Which are the top 5 banks based on transaction volume?
select Bank_Name,count(*) as total_transactions from upi_transactions group by Bank_Name order by total_transactions desc limit 5;

-- Business Insights:
-- 1. Axis Bank has the highest transaction volume.
-- 2. Bank-wise analysis helps identify banks with higher UPI usage.
-- 3. Transaction distribution varies across different banks.

-- 17. Find all transactions where the transaction amount is greater than the average transaction amount.
select * from upi_transactions where Transaction_Amount>(select avg(Transaction_Amount) from upi_transactions);

-- 18. Rank banks based on their total transaction amount.
select Bank_Name,sum(transaction_Amount) as total_Amount,dense_rank()
 over(order by sum(transaction_Amount) desc) as Bank_Rank from upi_transactions group by Bank_Name;
 
 -- 19. Rank all transactions based on transaction amount in descending order.
 select Transaction_ID,Transaction_Amount,rank() over(order by Transaction_Amount desc) as Transaction_Rank from upi_transactions;
 
 -- Business Insight:
-- Identifies the highest-value transactions and
-- compares transaction amounts across all transactions.
 
 -- 20. Which cities have more than 100 transactions?
 select City,count(*) as total_transaction from upi_transactions group by City having total_transaction>100;
 
 -- Business Insight:
-- Identifies cities with more than 100 transactions,
-- highlighting locations with higher UPI transaction activity.
 
 -- 21. Categorize transactions based on transaction amount.
 select Transaction_ID,Transaction_Amount,
 case
  when Transaction_Amount <1000 then "low"
  when Transaction_Amount between 1000 and 5000 then "medium"
  else "high"
  end as Transaction_Category from upi_transactions;
  
  -- Business Insight:
-- Categorizes transactions into Low, Medium, and High value groups,
-- making transaction behavior easier to understand.
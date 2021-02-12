CREATE DATABASE IF NOT EXISTS credit_card_classification;
USE credit_card_classification;
# table creation
/*
Create TABLE IF NOT EXISTS credit_card_data (
	customer_number INT PRIMARY KEY,
    offer_accepted VARCHAR(255),
    reward VARCHAR(255),
    mailer_type VARCHAR(255),
    income_level VARCHAR(255),
    n_bank_accounts_open INT,
	overdraft_protection VARCHAR(255),
    credit_rating VARCHAR(255),
    n_credit_cards INT,
    n_homes_owned INT,
    n_household_size INT,
    house_owner VARCHAR(255),
    avg_balance INT,
    balance_q1 INT,
    balance_q2 INT,
    balance_q3 INT,
    balance_q4 INT);
*/
    
# give permission to SQL to import data fromo CSV file
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SELECT * FROM credit_card_data;

# 4. Select all the data from table credit_card_data to check if thee data was imported corrrectly.
SELECT * FROM credit_card_data;

# 5. User the altre tablle commnad to drop the column Q4 Balance from the database, as we would not use it in the analysis with SQL.
# Select all the data from the table to verify if the command worked. Limit your returned results to 10.
ALTER TABLE credit_card_data DROP COLUMN `Q4 Balance`;

SELECT *
FROM credit_card_data
LIMIT 10;

# 6. Use sql query to find how many rows of data you have.
SELECT COUNT(*)
FROM credit_card_data;

# 7. Now we will try to find thee unique values in some of the categorical columns:
# What are the unique evalues in the column_offer_accepted?
SELECT DISTINCT `Offer Accepted`
FROM credit_card_data;

# What are the unique values in the column reward?
SELECT DISTINCT `Reward`
FROM credit_card_data;

# What are the uniquee values in the column mailer_type?
SELECT DISTINCT `Mailer Type`
FROM credit_card_data;

# What are the unique values in the column credit_cards_held?
SELECT DISTINCT `# Credit Cards Held`
FROM credit_card_data;

# What are the unique evalues in the column household_size?
SELECT DISTINCT `Household Size`
FROM credit_card_data;

# 8. Arrange the data in a decreasing order by the average_balance of the house.
# Return only the customor_number of the top 10 customers with the higheset average_balance in your data.
SELECT `Customer Number`
FROM credit_card_data
ORDER BY `Average Balance` DESC
LIMIT 10;

# 9. What is the average balance of all the customers in your data?
SELECT AVG(`Average Balance`) AS avg_balance
FROM credit_card_data;

# 10. In this exercise we will use simple group by to check the properties of some of the categorical variables in our data.
# Note wherever average_balance is asked, please take the average of the column average_balance:
# What is the average balance of the customers grouped by Income Level? 
# The returned result should have only two columns, income level and Average balance of the customers. Use an alias to change the name of the second column.
SELECT `Income Level`, ROUND(AVG(`Average Balance`), 2) AS avg_balance
FROM credit_card_data
GROUP BY 1;

# What is the average balance of the customers grouped by number_of_bank_accounts_open? The returned result should have only two columns,
# number_of_bank_accounts_open and Average balance of the customers. Use an alias to change the name of the second column.
SELECT `# Bank Accounts Open`, ROUND(AVG(`Average Balance`),2) AS avg_balance
FROM credit_card_data
GROUP BY 1;

# What is the average number of credit cards held by customers for each of the credit card ratings?
# The returned result should have only two columns, rating and average number of credit cards held. Use an alias for the second column.
SELECT `Credit Rating`, ROUND(AVG(`# Credit Cards Held`),2) AS avg_balance
FROM credit_card_data
GROUP BY 1;

# Is there any correlation between the columns credit_cards_held and number_of_bank_accounts_open?
# You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column.
# Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
SELECT `# Credit Cards Held`, AVG(`# Bank Accounts Open`) AS 'Average Accounts'
FROM credit_card_data
GROUP BY 1
ORDER BY 1;
# There is no correlation, apparently.

# 11. Your managers are only interested in the customers with the following properties:
# - Credit rating medium or high
# - Credit cards held 2 or less
# - Owns their own home
# - Household size 3 or more
# For the rest of the things, they are not too concerned. Write a simple query to find what are the options available for them?
SELECT `Customer Number`
FROM credit_card_data
WHERE `Credit Rating` IN ('High', 'Medium') AND `# Credit Cards Held` <= 2 AND `Own Your Home` = 'Yes' AND `Household Size` >= 3;

# Can you filter the customers who accepted the offers here?
SELECT `Customer Number`
FROM credit_card_data
WHERE `Credit Rating` IN ('High', 'Medium') AND `# Credit Cards Held` <= 2 AND `Own Your Home` = 'Yes' AND `Household Size` >= 3 AND `Offer Accepted`= 'Yes';

# 12. Your managers want to find out the list of customers whose average balance is less than the average balance of all the customers
# in the database. Write a query to show them the list of such customers. You might need to use a subquery for this problem.
SELECT `Customer Number`
FROM credit_card_data
WHERE `Average Balance` < (SELECT AVG(`Average Balance`) FROM credit_card_data);

# 13. Since this is something that the senior management is regularly interested in, create a view of the same query.
CREATE VIEW customers_with_less_avg_balance AS
SELECT `Customer Number`
FROM credit_card_data
WHERE `Average Balance` < (SELECT AVG(`Average Balance`) FROM credit_card_data);

# 14. What is the number of people who accepted the offer vs number of people who did not?
SELECT `Offer Accepted`, COUNT(*) n_people_acceptd
FROM credit_card_data
GROUP BY 1;

# 15. Your managers are more interested in customers with a credit rating of high or low.
# What is the difference in average balances of the customers with high credit card rating and low credit card rating?
SELECT `Credit Rating`, ROUND(AVG(`Average Balance`), 2) avg_balance
FROM credit_card_data
WHERE `Credit Rating` IN ('High', 'Low')
GROUP BY 1;

# 16. In the database, which all types of communication (mailer_type) were used and with how many customers?
SELECT `Mailer Type`, COUNT(*) n_customers
FROM credit_card_data
GROUP BY 1;

# 17. Provide the details of the customer that is the 11th least Q1_balance in your database.
SELECT *
FROM (SELECT * FROM credit_card_data ORDER BY `Q1 Balance` ASC LIMIT 11) sb
ORDER BY `Q1 Balance` DESC
LIMIT 1;
# Online Grocery Store Database
Author: Emily Haller 

Created an online grocery store database Created a MySQL online grocery store database, enabling secure tracking of purchases, products, and deliveries and performed complex SQL querie

## Objective
----------
• Assist at risk New Yorkers to perform food shopping without visiting a crowded store.
• Create a database to track purchases, products and delivery for an on- line grocery store.
• Create searches and output using SQL
• Manage security

## Database Requirements 
----------
The database design includes the following requirements:
• Customers purchase products from the grocery store. Identify the
customer name, billing address, account, password and phone.
• Staff assist in the checkout, packing and delivery of customer orders.
Identify the staff name, address, email and department. Staff can be assigned to many departments. In addition, identify current and all previous job titles and corresponding salary.
• Grocery products are saved in warehouses around NYC. Identify the warehouse location and warehouse type (refrigerated, kitchen used to prepare foods, etc.)
• Products are stored in warehouses. Identify the product name, product type (produce, fish, meat, dairy, etc.), calories, sodium, quantity, expiration date and warehouse where the product is stored. One product can be stored in multiple warehouses.
• Customers purchase products. Identify the product purchased, price, method of payment and delivery address.
• Customer orders are delivered. Identify the delivery address, staff who assisted with the delivery and delivery date.
• Customers can rate products offered by the grocery. Track the customer who provides the rating, product rated, method of rating (number, stars, letter grade, etc.), date of rating and rating comment. Customers can enter open ended narrative text for each product sold by the grocery. For instance, “The Kellogg’s Raisin Bran cereal is great, although it doesn’t include as many raisins as the Post Raisin Bran cereal.” One customer can rate many products.
• Customers can complete a survey of the order/delivery. Track the customer who completes the survey, date of survey, method of rating the survey (number, stars, letter grade, etc.) and rating comments. A customer can only complete one survey for each order.
• Security
 - Staff are restricted from accessing customer credit card numbers,
       expiration dates.
 - Customers can view past orders, but NOT change past orders.
 - Staff can’t delete purchases after they are entered in the system.
• Include at least two sequence numbers to create unique values.

## Additional Design Requirements 
----------
• Include all SQL commands to create your database and answer the questions including create tables, select, update, insert data, alter column names and alter column types.
• Normalize your database to third normal form.
• Output for all questions must include at least one row displayed.
• Identify and create primary keys for all tables.
• Create foreign keys to enforce referential integrity.
• Include the question, SQL command to answer the question and output from the
SQL command.
• Create descriptive column labels for all output. For instance, don’t display a
column label named count(*)

## Questions
• Replace underlined items with values of your own choosing. For instance, replace the underlined terms last year with your own date range.
• Format all output. For instance, all numbers will display with commas, dollar values will display with a $ prefix and create descriptive labels for all columns.
• Be very descriptive explaining your results. For instance, use appropriate terminology, print screens and SQL
1. Identify customers who have not completed a purchase/delivery survey in the last 6 months. Display the customer name and email. Use a nested select to answer this question.
2. Identify the most popular product purchased in the last month. Display four columns: warehouse, product name, product type and number of orders. Display one distinct row for each warehouse, product and product type. Display the product with the most orders first.
3. Identify customers with the most purchases of fruit in the last year by customer location. Display five rows in your output – one row for each borough. Display three columns: borough, number of orders, total dollar amount of order. The borough with the most orders is displayed first. You may need multiple SQL to answer this question.
4. Identify customers with no comments in the product survey. Display the customer name.
5. Search the open-ended narrative text/comments in the product and delivery comments to identify personally identifiable information (PII). This includes any data that could potentially be used to identify a person. For instance, examples of PII include email address, date of birth, Social Security number, bank account number, home address, and full name. Display the customer who created the comment, date of comment and the comment. Order the output by customer name.
6. Customers can view, but not change past orders. Create SQL to implement. Demonstrate your implementation will not edit past orders by attempting to change data.
7. Usingpurchasesmadeinthelastmonth,identifycustomerswith children. Display the customer name and email. Order the output by customer name. Replace children with other demographic characteristics. For instance, dog owners, seniors, vegetarians, Tesla car owners, etc.
8. Identify staff with the most deliveries in the last month. Display two columns: staff and number of deliveries. Display one row for each distinct staff. Display the staff with the most deliveries first.
9. Staff are restricted from accessing customer credit card number and expiration dates. Create SQL to implement. Demonstrate your implementation will prevent staff from viewing customer credit card data.
10. Staff can’t delete purchases after they are entered in the database. Create SQL to implement. Demonstrate your implementation will prevent staff from deleting purchases.
       
11. The product Raisin Bran is no longer being offered by the grocery store and being available for 3 years. Identify the SQL to implement.
12. Use the SQL DESCRIBE operation to display the structure for all tables. 13. Display the version 

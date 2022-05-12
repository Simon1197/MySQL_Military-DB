# MySQL_Military-DB

1) - Define the information content of your database.

a) - Define a set of entities and appropriate attributes for each entity. 

b) - Define a set of relationships that might exist between/among entities and attributes. Such 
 relationships may include one-to-one, one-to-many and many-to-many associations.
 
c) - Define a set of constraints that may be imposed on data.

2) - Define an E-R Diagram for your database design.
3) - Define a relational schema for your database design.
Make sure that you have both one-to-many and many-to-many associations.
a)-Define one or more realistic key(s) for every relation scheme. Use both simple and composite keys.
b)-Define a realistic set of Functional / Multi-Valued Dependencies (when appropriate) for every
relation scheme.
C-Check whether your relational schema is in 2NF, 3NF, BCNF, 4NF.
d)-Put your relational schema in the highest normal form that is possible. 
Note that, every relation scheme should be in a specific normal form in order to have the relational 
schema in that normal form.
NOTE: Please provide a detailed explanation for every question when appropriate. 
 4) Implementation: Create your database using MySQL, or… to Perform the following operations.
Create 4 tables from your database project that are connected/linked together and insert few dummy records 
into these tables. Then use these tables to answer the following queries.
A) You are required to execute SQL queries that include the following operations. For each query, provide the 
SQL statements along with the output. For each of the following, try different SQL statements (i.e., using one 
relation, more than one relations,...).
- Create tables: (just for creating 4 tables, not all)
- Select: select involving one/more conditions in Where Clause
select with aggregate functions (i.e., SUM,MIN,MAX,AVG,COUNT)
 select with Having, Group By, Order By clause
Nested Select
select involving the Union operation
- Insert: insert one tuple into a table (for 2 tables, just add 3 records for each table)
insert a set of tuples (by using another select statement)
insert involving two tables
- Delete: delete one tuple or a set of tuples: from one table, from multiple tables.
- Update: update one tuple or a set of tuples: from one table, from multiple tables.
- Create View: - based on one relation and more than one relation:
- operate on View (i.e., select, insert, delete, update,..)
B) Also, create at least 4 different practical/useful triggers (written in MySQL) for your database to perform the 
following tasks:
- enforcing referential integrity
- enforcing attribute domain constraints
- creating database log
- gathering statistics
Show how these triggers are used and what these triggers produce (outputs)

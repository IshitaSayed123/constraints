\sql
Switching to SQL mode... Commands end with ;
 MySQL  SQL > \connect root@localhost
Creating a session to 'root@localhost'
Fetching global names for auto-completion... Press ^C to stop.
Your MySQL connection id is 27 (X protocol)
Server version: 8.0.32 MySQL Community Server - GPL
No default schema selected; type \use <schema> to set one.
 MySQL  localhost:33060+ ssl  SQL > use constraints;
Default schema set to `constraints`.
Fetching global names, object names from `constraints` for auto-completion... Press ^C to stop.
 MySQL  localhost:33060+ ssl  constraints  SQL > create table students(
                                              -> id int AUTO_INCREMENT UNIQUE,
                                              -> name varchar(20) NOT NULL,
                                              -> email varchar(30)  UNIQUE,
                                              -> marks int CHECK(marks between 0 and 100),
                                              -> status DEFAULT 'active');
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DEFAULT 'active')' at line 6
 MySQL  localhost:33060+ ssl  constraints  SQL > create table students( id int AUTO_INCREMENT UNIQUE, name varchar(20) NOT NULL, email varchar(30)  UNIQUE, marks int CHECK(marks between 0 and 100), status varchar(20) DEFAULT 'active');
Query OK, 0 rows affected (0.0118 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > desc students;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| id     | int         | NO   | PRI | NULL    | auto_increment |
| name   | varchar(20) | NO   |     | NULL    |                |
| email  | varchar(30) | YES  | UNI | NULL    |                |
| marks  | int         | YES  |     | NULL    |                |
| status | varchar(20) | YES  |     | active  |                |
+--------+-------------+------+-----+---------+----------------+
5 rows in set (0.0022 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > create table products (
                                              -> product_id int AUTO_INCREMENT UNIQUE,
                                              -> product_name varchar(30) NOT NULL UNIQUE,
                                              -> price int CHECK(price>0),
                                              -> stock int DEFAULT 10);
Query OK, 0 rows affected (0.0106 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > desc students;
+--------+-------------+------+-----+---------+----------------+
| Field  | Type        | Null | Key | Default | Extra          |
+--------+-------------+------+-----+---------+----------------+
| id     | int         | NO   | PRI | NULL    | auto_increment |
| name   | varchar(20) | NO   |     | NULL    |                |
| email  | varchar(30) | YES  | UNI | NULL    |                |
| marks  | int         | YES  |     | NULL    |                |
| status | varchar(20) | YES  |     | active  |                |
+--------+-------------+------+-----+---------+----------------+
5 rows in set (0.0050 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > create table employees(
                                              -> emp_no AUTO_INCREMENT UNIQUE,
                                              -> name ;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AUTO_INCREMENT UNIQUE,
name' at line 2
 MySQL  localhost:33060+ ssl  constraints  SQL > create table employees( emp_no int AUTO_INCREMENT UNIQUE, name varchar(20) NOT NULL, email varchar(30) UNIQUE, salary int CHECK(salary>=1000 AND salary <=50000,department varchar(20) DEFAULT 'IT'); ;
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',department varchar(20) DEFAULT 'IT')' at line 1
ERROR: 1065: Query was empty
 MySQL  localhost:33060+ ssl  constraints  SQL > create table employees( emp_no int AUTO_INCREMENT UNIQUE, name varchar(20) NOT NULL, email varchar(30) UNIQUE, salary int CHECK(salary>=1000 AND salary <=50000,department varchar(20) DEFAULT 'IT');
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',department varchar(20) DEFAULT 'IT')' at line 1
 MySQL  localhost:33060+ ssl  constraints  SQL > create table employees( emp_no int AUTO_INCREMENT UNIQUE, name varchar(20) NOT NULL, email varchar(30) UNIQUE, salary int CHECK(salary>=1000 AND salary <=50000),department varchar(20) DEFAULT 'IT');
Query OK, 0 rows affected (0.0096 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > DESC employees;
+------------+-------------+------+-----+---------+----------------+
| Field      | Type        | Null | Key | Default | Extra          |
+------------+-------------+------+-----+---------+----------------+
| emp_no     | int         | NO   | PRI | NULL    | auto_increment |
| name       | varchar(20) | NO   |     | NULL    |                |
| email      | varchar(30) | YES  | UNI | NULL    |                |
| salary     | int         | YES  |     | NULL    |                |
| department | varchar(20) | YES  |     | IT      |                |
+------------+-------------+------+-----+---------+----------------+
5 rows in set (0.0025 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > insert into students(name,email,marks) values
                                              -> ('Ravi','ravi@gmail.com',85);
Query OK, 1 row affected (0.0029 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > select*from students;
+----+------+----------------+-------+--------+
| id | name | email          | marks | status |
+----+------+----------------+-------+--------+
|  1 | Ravi | ravi@gmail.com |    85 | active |
+----+------+----------------+-------+--------+
1 row in set (0.0006 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > insert into students(name,email,marks) values ('Asha','asha@gmail.com',110);
ERROR: 3819: Check constraint 'students_chk_1' is violated.
 MySQL  localhost:33060+ ssl  constraints  SQL > insert into students(name,email,marks) values ('Asha','asha@gmail.com',100);
Query OK, 1 row affected (0.0020 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > select*from students;
+----+------+----------------+-------+--------+
| id | name | email          | marks | status |
+----+------+----------------+-------+--------+
|  1 | Ravi | ravi@gmail.com |    85 | active |
|  2 | Asha | asha@gmail.com |   100 | active |
+----+------+----------------+-------+--------+
2 rows in set (0.0005 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > insert into employees(name,email,salary) values 
                                              -> ('john','john@gmail.com',30000),('mary','john@gmail.com',25000),('alex','alex@gmail.com',9000);
ERROR: 1062: Duplicate entry 'john@gmail.com' for key 'employees.email'
 MySQL  localhost:33060+ ssl  constraints  SQL > insert into employees(name,email,salary) values  ('john','john@gmail.com',30000),('mary','mary@gmail.com',25000),('alex','alex@gmail.com',9000);
Query OK, 3 rows affected (0.0022 sec)

Records: 3  Duplicates: 0  Warnings: 0
 MySQL  localhost:33060+ ssl  constraints  SQL > select*from employees;
+--------+------+----------------+--------+------------+
| emp_no | name | email          | salary | department |
+--------+------+----------------+--------+------------+
|      4 | john | john@gmail.com |  30000 | IT         |
|      5 | mary | mary@gmail.com |  25000 | IT         |
|      6 | alex | alex@gmail.com |   9000 | IT         |
+--------+------+----------------+--------+------------+
3 rows in set (0.0006 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > insert into products (product_name,price) values
                                              -> ('ball',150);
Query OK, 1 row affected (0.0033 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > select * from products;
+------------+--------------+-------+-------+
| product_id | product_name | price | stock |
+------------+--------------+-------+-------+
|          1 | ball         |   150 |    10 |
+------------+--------------+-------+-------+
1 row in set (0.0005 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > select*from students where (marks between 0 and 100);
+----+------+----------------+-------+--------+
| id | name | email          | marks | status |
+----+------+----------------+-------+--------+
|  1 | Ravi | ravi@gmail.com |    85 | active |
|  2 | Asha | asha@gmail.com |   100 | active |
+----+------+----------------+-------+--------+
2 rows in set (0.0006 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > update students set marks=marks+5 where (marks<90);

Query OK, 1 row affected (0.0027 sec)

Rows matched: 1  Changed: 1  Warnings: 0
 MySQL  localhost:33060+ ssl  constraints  SQL > select * from students;
+----+------+----------------+-------+--------+
| id | name | email          | marks | status |
+----+------+----------------+-------+--------+
|  1 | Ravi | ravi@gmail.com |    90 | active |
|  2 | Asha | asha@gmail.com |   100 | active |
+----+------+----------------+-------+--------+
2 rows in set (0.0005 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > create table users 
                                              -> (user_id int AUTO_INCREMENT UNIQUE,
                                              -> username varchar(30) NOT NULL UNIQUE,
                                              -> email varchar(30) UNIQUE CHECK ("%@gmail.com"),
                                              -> singup_status varchar(20) DEFAULT 'pending',
                                              -> age int CHECK (age between 18 AND 60);
ERROR: 1064: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 6
 MySQL  localhost:33060+ ssl  constraints  SQL > create table users  (user_id int AUTO_INCREMENT UNIQUE, username varchar(30) NOT NULL UNIQUE, email varchar(30) UNIQUE CHECK ("%@gmail.com"), singup_status varchar(20) DEFAULT 'pending', age int CHECK (age between 18 AND 60));
ERROR: 3813: Column check constraint 'users_chk_1' references other column.
 MySQL  localhost:33060+ ssl  constraints  SQL > create table users  (user_id int AUTO_INCREMENT UNIQUE, username varchar(30) NOT NULL UNIQUE, email varchar(30) UNIQUE CHECK (email like "%@gmail.com"), singup_status varchar(20) DEFAULT 'pending', age int CHECK (age between 18 AND 60));
Query OK, 0 rows affected (0.0103 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > desc users;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| user_id       | int         | NO   | PRI | NULL    | auto_increment |
| username      | varchar(30) | NO   | UNI | NULL    |                |
| email         | varchar(30) | YES  | UNI | NULL    |                |
| singup_status | varchar(20) | YES  |     | pending |                |
| age           | int         | YES  |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
5 rows in set (0.0023 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > insert into users (username,email,age) values
                                              -> ('user1','user1@gmail.com',17);
ERROR: 3819: Check constraint 'users_chk_2' is violated.
 MySQL  localhost:33060+ ssl  constraints  SQL > insert into users (username,email,age) values ('user2','user2@gmail.com',25);
Query OK, 1 row affected (0.0019 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > select * from users;
+---------+----------+-----------------+---------------+-----+
| user_id | username | email           | singup_status | age |
+---------+----------+-----------------+---------------+-----+
|       1 | user2    | user2@gmail.com | pending       |  25 |
+---------+----------+-----------------+---------------+-----+
1 row in set (0.0006 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > insert into users (username,email,age) values ('user3','user3@gmail.com',30);
Query OK, 1 row affected (0.0014 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > select * from users;
+---------+----------+-----------------+---------------+-----+
| user_id | username | email           | singup_status | age |
+---------+----------+-----------------+---------------+-----+
|       1 | user2    | user2@gmail.com | pending       |  25 |
|       2 | user3    | user3@gmail.com | pending       |  30 |
+---------+----------+-----------------+---------------+-----+
2 rows in set (0.0005 sec)
 MySQL  localhost:33060+ ssl  constraints  SQL > insert into users (username,email,age) values ('user4','user4@yahoo.com',40);
ERROR: 3819: Check constraint 'users_chk_1' is violated.
 MySQL  localhost:33060+ ssl  constraints  SQL > insert into students (name,email,marks) values
                                              -> (null,'test@gmail.com',90),
                                              -> ('sam','sam@gmail.com',105),
                                              -> ('lina','lina@gmail.com',80);
ERROR: 1048: Column 'name' cannot be null
 MySQL  localhost:33060+ ssl  constraints  SQL > insert into students (name,email,marks) values (test,'test@gmail.com',90), ('sam','sam@gmail.com',105), ('lina','lina@gmail.com',80);
ERROR: 1054: Unknown column 'test' in 'field list'
 MySQL  localhost:33060+ ssl  constraints  SQL > insert into students (name,email,marks) values (test,'test@gmail.com',90), ('sam','sam@gmail.com',105), ('lina','lina@gmail.com',80);
ERROR: 1054: Unknown column 'test' in 'field list'
 MySQL  localhost:33060+ ssl  constraints  SQL > 
1.Students Insert – Explain Why Record Fails
Explanation:
The record with marks = 110 fails because the marks column has a CHECK constraint that restricts values between 0 and 100. Any value outside this range violates the constraint, so the database rejects the insertion to maintain data integrity.
2.Employees Insert – Explain Constraint Violations
Explanation:
The second employee record fails because the email column has a UNIQUE constraint, and duplicate email values are not allowed. The third employee record fails because the salary value is below the minimum allowed by the CHECK constraint. The database enforces these constraints to prevent invalid or inconsistent data.
3. ️Insert with DEFAULT & AUTO_INCREMENT – Explain
Explanation:
When values are not provided for columns with AUTO_INCREMENT and DEFAULT constraints, the database automatically assigns values. AUTO_INCREMENT generates the next sequential number, and DEFAULT assigns the predefined value. This reduces manual input and ensures consistency.
4️.CHECK Constraint Query – Explain
Explanation:
The SELECT query filters only those records that satisfy the CHECK constraint condition and have an active status. This ensures that only valid and currently active student records are retrieved.
5️.UPDATE with Constraints – Explain Why It May Fail
Explanation:
The update operation may fail because increasing marks by 5 can cause the value to exceed the maximum limit defined by the CHECK constraint (marks ≤ 100). When an update violates a constraint, the database rejects the operation to preserve data integrity.
6. Users Table – Constraint Violations (Explain Why)
Explanation:
The record with age 17 fails because it violates the CHECK constraint that enforces the allowed age range. The record with a non-Gmail email address fails because it does not match the email format enforced by the CHECK constraint.
Only the valid record is inserted because it satisfies all constraints.
️7. Multiple Inserts with Constraints – Explain Why
Explanation:
When inserting multiple rows in a single statement, if any one row violates a constraint such as NOT NULL or CHECK, the entire insert operation fails. This ensures transactional consistency and prevents partial insertion of invalid data.

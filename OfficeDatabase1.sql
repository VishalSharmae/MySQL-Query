mysql> use office
Database changed
mysql> show table;
mysql> show tables;
+------------------+
| Tables_in_office |
+------------------+
| worker           |
+------------------+
1 row in set (0.53 sec)

mysql> select * from worker;
Empty set (0.27 sec)

mysql> INSERT INTO Worker
    -> (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    -> (001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
    -> (002, 'Niharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
    -> (003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
    -> (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
    -> (005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
    -> (006, 'Vipul', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
    -> (007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
    -> (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin');
Query OK, 8 rows affected (0.74 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> select * from worker;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
8 rows in set (0.00 sec)


mysql> CREATE TABLE BONUS(
    -> WORKER_REF_ID INT,
    -> BONUS_DATE DATETIME,
    -> BONUS_AMOUNT INT(10),
    -> FOREIGN KEY (WORKER_REF_ID) REFERENCES WORKER(WORKER_ID) ON DELETE CASCADE
    -> );
Query OK, 0 rows affected, 1 warning (3.53 sec)

mysql> INSERT INTO BONUS
    -> (WORKER_REF_ID, BONUS_DATE, BONUS_AMOUNT)VALUES
    -> (001,'16-02-20 00.00.00', 5000),
    -> (002, '16-06-11 00.00.00', 3000),
    -> (003, '16-02-20 00.00.00', 4000),
    -> (001, '16-02-20 00.00.00', 4500),
    -> (002, '16-06-20 00.00.00', 3500);
Query OK, 5 rows affected (0.28 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE TITLE(
    -> WORKER_REF_ID INT,
    -> WORKER_TITLE CHAR(25),
    -> AFFECTED_FROM DATETIME,
    -> FOREIGN KEY (WORKER_REF_ID) REFERENCES WORKER(WORKER_ID) ON DELETE CASCADE);
Query OK, 0 rows affected (3.02 sec)

mysql> INSERT INTO TITLE
    -> (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    -> (001, 'Manager', '16-02-20 00.00.00'),
    -> (002, 'Executive', '16-06-11 00.00.00'),
    -> (008, 'Executive', '16-06-11 00.00.00'),
    -> (005, 'Manager', '16-06-11 00.00.00'),
    -> (004, 'Asst. Manager', '16-06-11 00.00.00'),
    -> (007, 'Executive', '16-06-11 00.00.00'),
    -> (006, 'Lead', '16-06-11 00.00.00'),
    -> (003, 'Lead', '16-06-11 00.00.00');
Query OK, 8 rows affected (0.19 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> show tables;
+------------------+
| Tables_in_office |
+------------------+
| bonus            |
| title            |
| worker           |
+------------------+
3 rows in set (0.10 sec)
select * from worker;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
8 rows in set (0.00 sec)

mysql> select * from bonus;
+---------------+---------------------+--------------+
| WORKER_REF_ID | BONUS_DATE          | BONUS_AMOUNT |
+---------------+---------------------+--------------+
|             1 | 2016-02-20 00:00:00 |         5000 |
|             2 | 2016-06-11 00:00:00 |         3000 |
|             3 | 2016-02-20 00:00:00 |         4000 |
|             1 | 2016-02-20 00:00:00 |         4500 |
|             2 | 2016-06-20 00:00:00 |         3500 |
+---------------+---------------------+--------------+
5 rows in set (0.00 sec)

mysql> select * from title;
+---------------+---------------+---------------------+
| WORKER_REF_ID | WORKER_TITLE  | AFFECTED_FROM       |
+---------------+---------------+---------------------+
|             1 | Manager       | 2016-02-20 00:00:00 |
|             2 | Executive     | 2016-06-11 00:00:00 |
|             8 | Executive     | 2016-06-11 00:00:00 |
|             5 | Manager       | 2016-06-11 00:00:00 |
|             4 | Asst. Manager | 2016-06-11 00:00:00 |
|             7 | Executive     | 2016-06-11 00:00:00 |
|             6 | Lead          | 2016-06-11 00:00:00 |
|             3 | Lead          | 2016-06-11 00:00:00 |
+---------------+---------------+---------------------+
8 rows in set (0.00 sec)

mysql> select first_name as worker_name from worker;
+-------------+
| worker_name |
+-------------+
| Monika      |
| Niharika    |
| Vishal      |
| Amitabh     |
| Vivek       |
| Vipul       |
| Satish      |
| Geetika     |
+-------------+
8 rows in set (0.00 sec)

mysql> select worker_id AS SERIAL_NO FROM WORKER;
+-----------+
| SERIAL_NO |
+-----------+
|         1 |
|         2 |
|         3 |
|         4 |
|         5 |
|         6 |
|         7 |
|         8 |
+-----------+
8 rows in set (0.00 sec)

mysql> select worker_id, FIRST_NAME AS SERIAL_NO FROM WORKER;
+-----------+-----------+
| worker_id | SERIAL_NO |
+-----------+-----------+
|         1 | Monika    |
|         2 | Niharika  |
|         3 | Vishal    |
|         4 | Amitabh   |
|         5 | Vivek     |
|         6 | Vipul     |
|         7 | Satish    |
|         8 | Geetika   |
+-----------+-----------+
8 rows in set (0.00 sec)

mysql> select worker_id AS SERIAL_NO, FIRST_NAME AS WORKER_NAME FROM WORKER;
+-----------+-------------+
| SERIAL_NO | WORKER_NAME |
+-----------+-------------+
|         1 | Monika      |
|         2 | Niharika    |
|         3 | Vishal      |
|         4 | Amitabh     |
|         5 | Vivek       |
|         6 | Vipul       |
|         7 | Satish      |
|         8 | Geetika     |
+-----------+-------------+
8 rows in set (0.00 sec)

mysql> SELECT UPPER(FIRST_NAME) FROM WORKER;
+-------------------+
| UPPER(FIRST_NAME) |
+-------------------+
| MONIKA            |
| NIHARIKA          |
| VISHAL            |
| AMITABH           |
| VIVEK             |
| VIPUL             |
| SATISH            |
| GEETIKA           |
+-------------------+
8 rows in set (0.03 sec)

mysql> SELECT UPPER(FIRST_NAME), UPPER(LAST_NAME) FROM WORKER;
+-------------------+------------------+
| UPPER(FIRST_NAME) | UPPER(LAST_NAME) |
+-------------------+------------------+
| MONIKA            | ARORA            |
| NIHARIKA          | VERMA            |
| VISHAL            | SINGHAL          |
| AMITABH           | SINGH            |
| VIVEK             | BHATI            |
| VIPUL             | DIWAN            |
| SATISH            | KUMAR            |
| GEETIKA           | CHAUHAN          |
+-------------------+------------------+
8 rows in set (0.00 sec)

mysql> SELECT DISTINCT(DEPARTMENT) FROM WORKER;
+------------+
| DEPARTMENT |
+------------+
| HR         |
| Admin      |
| Account    |
+------------+
3 rows in set (0.10 sec)

mysql> SELECT SUBSTRING(FIRST_NAME, 1,3) FROM WORKER;
+----------------------------+
| SUBSTRING(FIRST_NAME, 1,3) |
+----------------------------+
| Mon                        |
| Nih                        |
| Vis                        |
| Ami                        |
| Viv                        |
| Vip                        |
| Sat                        |
| Gee                        |
+----------------------------+
8 rows in set (0.02 sec)

mysql> SELECT SUBSTRING(FIRST_NAME, 1,1) FROM WORKER;
+----------------------------+
| SUBSTRING(FIRST_NAME, 1,1) |
+----------------------------+
| M                          |
| N                          |
| V                          |
| A                          |
| V                          |
| V                          |
| S                          |
| G                          |
+----------------------------+
8 rows in set (0.00 sec)

mysql> SELECT SUBSTRING(FIRST_NAME, 1,5) FROM WORKER;
+----------------------------+
| SUBSTRING(FIRST_NAME, 1,5) |
+----------------------------+
| Monik                      |
| Nihar                      |
| Visha                      |
| Amita                      |
| Vivek                      |
| Vipul                      |
| Satis                      |
| Geeti                      |
+----------------------------+
8 rows in set (0.00 sec)

mysql> SELECT INSTR(FIRST_NAME, BINARY 'A') FROM WORKER WHERE FIRST_NAME = 'AMITABH';
+-------------------------------+
| INSTR(FIRST_NAME, BINARY 'A') |
+-------------------------------+
|                             1 |
+-------------------------------+
1 row in set (0.00 sec)

mysql> SELECT INSTR(FIRST_NAME, BINARY 'A') FROM WORKER;
+-------------------------------+
| INSTR(FIRST_NAME, BINARY 'A') |
+-------------------------------+
|                             6 |
|                             4 |
|                             5 |
|                             1 |
|                             0 |
|                             0 |
|                             2 |
|                             7 |
+-------------------------------+
8 rows in set (0.00 sec)

mysql> SELECT INSTR(FIRST_NAME, BINARY 'A') FROM WORKER WHERE WORKER_ID = 1 && WORKER_ID = 5;
Empty set, 1 warning (0.00 sec)

mysql> SELECT INSTR(FIRST_NAME, BINARY 'A') FROM WORKER WHERE WORKER_ID = 1 || WORKER_ID = 5;
+-------------------------------+
| INSTR(FIRST_NAME, BINARY 'A') |
+-------------------------------+
|                             6 |
|                             0 |
+-------------------------------+
2 rows in set, 1 warning (0.00 sec)

mysql> SELECT INSTR(FIRST_NAME, BINARY 'A') FROM WORKER WHERE WORKER_ID = 1 || WORKER_ID = 5;
+-------------------------------+
| INSTR(FIRST_NAME, BINARY 'A') |
+-------------------------------+
|                             6 |
|                             0 |
+-------------------------------+
2 rows in set, 1 warning (0.00 sec)

mysql> SELECT INSTR(FIRST_NAME, BINARY 'a') FROM WORKER WHERE WORKER_ID = 1 || WORKER_ID = 5;
+-------------------------------+
| INSTR(FIRST_NAME, BINARY 'a') |
+-------------------------------+
|                             6 |
|                             0 |
+-------------------------------+
2 rows in set, 1 warning (0.00 sec)

mysql> SELECT INSTR(FIRST_NAME, BINARY 'a') FROM WORKER WHERE WORKER_ID = 1 || WORKER_ID = 5|| FIRST_NAME = 'Amitabh';
+-------------------------------+
| INSTR(FIRST_NAME, BINARY 'a') |
+-------------------------------+
|                             6 |
|                             1 |
|                             0 |
+-------------------------------+
3 rows in set, 2 warnings (0.00 sec)

mysql> SELECT RTRIM(FIRST_NAME) FROM WORKER;
+-------------------+
| RTRIM(FIRST_NAME) |
+-------------------+
| Monika            |
| Niharika          |
| Vishal            |
| Amitabh           |
| Vivek             |
| Vipul             |
| Satish            |
| Geetika           |
+-------------------+
8 rows in set (0.00 sec)


mysql> select ltrim(department) from worker;
+-------------------+
| ltrim(department) |
+-------------------+
| HR                |
| Admin             |
| HR                |
| Admin             |
| Admin             |
| Account           |
| Account           |
| Admin             |
+-------------------+
8 rows in set (0.19 sec)

mysql> select distinct length(department) from worker;
+--------------------+
| length(department) |
+--------------------+
|                  2 |
|                  5 |
|                  7 |
+--------------------+
3 rows in set (0.28 sec)

mysql> select distinct department, length(department) from worker;
+------------+--------------------+
| department | length(department) |
+------------+--------------------+
| HR         |                  2 |
| Admin      |                  5 |
| Account    |                  7 |
+------------+--------------------+
3 rows in set (0.04 sec)

mysql> select Replace(First_name, A, a) from worker;
ERROR 1054 (42S22): Unknown column 'A' in 'field list'
mysql> select Replace(First_name, 'A', 'a') from worker;
+-------------------------------+
| Replace(First_name, 'A', 'a') |
+-------------------------------+
| Monika                        |
| Niharika                      |
| Vishal                        |
| amitabh                       |
| Vivek                         |
| Vipul                         |
| Satish                        |
| Geetika                       |
+-------------------------------+
8 rows in set (0.49 sec)

mysql> select Replace(First_name, 'a', 'A') from worker;
+-------------------------------+
| Replace(First_name, 'a', 'A') |
+-------------------------------+
| MonikA                        |
| NihArikA                      |
| VishAl                        |
| AmitAbh                       |
| Vivek                         |
| Vipul                         |
| SAtish                        |
| GeetikA                       |
+-------------------------------+
8 rows in set (0.00 sec)

mysql> select instr(First_name, 'a') from worker;
+------------------------+
| instr(First_name, 'a') |
+------------------------+
|                      6 |
|                      4 |
|                      5 |
|                      1 |
|                      0 |
|                      0 |
|                      2 |
|                      7 |
+------------------------+
8 rows in set (0.05 sec)

mysql> select substring(First_name, 1,4) from worker;
+----------------------------+
| substring(First_name, 1,4) |
+----------------------------+
| Moni                       |
| Niha                       |
| Vish                       |
| Amit                       |
| Vive                       |
| Vipu                       |
| Sati                       |
| Geet                       |
+----------------------------+
8 rows in set (0.22 sec)

mysql> select substring(First_name, 1,8) from worker;
+----------------------------+
| substring(First_name, 1,8) |
+----------------------------+
| Monika                     |
| Niharika                   |
| Vishal                     |
| Amitabh                    |
| Vivek                      |
| Vipul                      |
| Satish                     |
| Geetika                    |
+----------------------------+
8 rows in set (0.00 sec)

mysql> select first_name as WorkerName, length(first_name) from worker;
+------------+--------------------+
| WorkerName | length(first_name) |
+------------+--------------------+
| Monika     |                  6 |
| Niharika   |                  8 |
| Vishal     |                  6 |
| Amitabh    |                  7 |
| Vivek      |                  5 |
| Vipul      |                  5 |
| Satish     |                  6 |
| Geetika    |                  7 |
+------------+--------------------+
8 rows in set (0.05 sec)

mysql> select concat(first_Name, ' ', last_name ) as complete_name from worker;
+-----------------+
| complete_name   |
+-----------------+
| Monika Arora    |
| Niharika Verma  |
| Vishal Singhal  |
| Amitabh Singh   |
| Vivek Bhati     |
| Vipul Diwan     |
| Satish Kumar    |
| Geetika Chauhan |
+-----------------+
8 rows in set (0.11 sec)
mysql> SELECT * FROM WORKER ORDER BY FIRST_NAME ASC;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
8 rows in set (0.04 sec)


mysql> SELECT * FROM WORKER ORDER BY FIRST_NAME DESC;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
8 rows in set (0.00 sec)


mysql> SELECT * FROM WORKER ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
8 rows in set (0.01 sec)

mysql> SELECT * FROM WORKER WHERE FIRST_NAME IN ('Vipul', 'Satish');
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
+-----------+------------+-----------+--------+---------------------+------------+
2 rows in set (0.02 sec)

mysql> SELECT * FROM WORKER WHERE FIRST_NAME = 'Vipul' || First_Name = 'Satish';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
+-----------+------------+-----------+--------+---------------------+------------+
2 rows in set, 1 warning (0.07 sec)

mysql> SELECT * FROM WORKER WHERE FIRST_NAME NOT IN ('Vipul', 'Satish');
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM WORKER WHERE FIRST_NAME != 'Vipul' || First_Name != 'Satish';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
8 rows in set, 1 warning (0.00 sec)

mysql> SELECT * FROM WORKER WHERE FIRST_NAME != 'Vipul' && First_Name != 'Satish';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
6 rows in set, 1 warning (0.00 sec)

mysql> SELECT * FROM WORKER WHERE FIRST_NAME = 'Vipul' && First_Name = 'Satish';
Empty set, 1 warning (0.09 sec)

mysql> select * from worker where department like 'Admin';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
4 rows in set (0.05 sec)

mysql> select * from worker where department = 'Admin';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
4 rows in set (0.01 sec)

mysql> select * from worker where department in ('Admin', 'Lead');
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
4 rows in set (0.00 sec)

mysql> select * from worker where department in ('Admin', 'Account');
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
6 rows in set (0.00 sec)

mysql> select * from worker where first_name like '%a%';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
6 rows in set (0.00 sec)

mysql> select * from worker where first_name like 'a%';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
1 row in set (0.00 sec)

mysql> select * from worker where first_name like '%a';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         2 | Niharika   | Verma     |  80000 | 2014-06-11 09:00:00 | Admin      |
|         8 | Geetika    | Chauhan   |  90000 | 2014-04-11 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
3 rows in set (0.00 sec)

mysql> select * from worker where first_name like '_____h';
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         7 | Satish     | Kumar     |  75000 | 2014-01-20 09:00:00 | Account    |
+-----------+------------+-----------+--------+---------------------+------------+
1 row in set (0.00 sec)

mysql> Select * from worker where salary > 100000 && salary < 500000;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
+-----------+------------+-----------+--------+---------------------+------------+
2 rows in set, 1 warning (0.05 sec)

mysql> Select * from worker where salary between 100000 and 500000;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
|         5 | Vivek      | Bhati     | 500000 | 2014-06-11 09:00:00 | Admin      |
|         6 | Vipul      | Diwan     | 200000 | 2014-06-11 09:00:00 | Account    |
+-----------+------------+-----------+--------+---------------------+------------+
5 rows in set (0.02 sec)

mysql> select * from worker where year(joining_date) = 2014 and month(joining_date) = 2;
+-----------+------------+-----------+--------+---------------------+------------+
| WORKER_ID | FIRST_NAME | LAST_NAME | SALARY | JOINING_DATE        | DEPARTMENT |
+-----------+------------+-----------+--------+---------------------+------------+
|         1 | Monika     | Arora     | 100000 | 2014-02-20 09:00:00 | HR         |
|         3 | Vishal     | Singhal   | 300000 | 2014-02-20 09:00:00 | HR         |
|         4 | Amitabh    | Singh     | 500000 | 2014-02-20 09:00:00 | Admin      |
+-----------+------------+-----------+--------+---------------------+------------+
3 rows in set (0.04 sec)

mysql> select count(*) from worker where department = 'Admin';
+----------+
| count(*) |
+----------+
|        4 |
+----------+
1 row in set (0.11 sec)

mysql> select count(*) from worker where department = 'admin';
+----------+
| count(*) |
+----------+
|        4 |
+----------+
1 row in set (0.00 sec)

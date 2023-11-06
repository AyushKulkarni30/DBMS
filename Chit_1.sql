1)
SELECT c_name, acc_type, amount
FROM cust_table
JOIN account_table ON cust_table.c_id = account_table.c_id
WHERE acc_type = 'Saving';

2)
a)
SELECT c_name, acc_type, amount
FROM cust_table
NATURAL JOIN account_table;

b)SELECT c_name, acc_type, amount
FROM cust_table
LEFT JOIN account_table ON cust_table.c_id = account_table.c_id;

c)
SELECT c_name, acc_type, amount
FROM cust_table
RIGHT JOIN account_table ON cust_table.c_id = account_table.c_id;

3)
SELECT c_name, city
FROM cust_table
WHERE city = (SELECT city FROM cust_table WHERE c_name = 'Pooja');

4)
SELECT c_id, acc_type, amount
FROM account_table
WHERE amount < (SELECT AVG(amount) FROM account_table);

5)SELECT c_id
FROM account_table
WHERE amount = (SELECT MAX(amount) FROM account_table);

6)
SELECT c.c_id, c.c_name, a.acc_type, a.amount
FROM account_table a
JOIN cust_table c ON a.c_id = c.c_id
WHERE (a.acc_type, a.amount) IN (SELECT acc_type, MIN(amount) FROM account_table GROUP BY acc_type);

7)
SELECT c_id, acc_type, amount
FROM account_table
WHERE amount > (SELECT MAX(amount) FROM account_table WHERE acc_type = 'Saving');

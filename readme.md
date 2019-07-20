# Intro to Sql

- let's start why creating a database named learning_database
```
CREATE DATABASE learning_database;
```

- let's create a users table and pictures table
    - Note: end all sql statements with ';' to let postgres know you are done with a statement.
    - In the example below we are using primary keys and foreign keys
        - A primary key must be unique. There cannot be more than one row in a table with the same primary key. This is to have a unique identifier for every row of data. Both the users and pictures table have 'id' as their primary key.
        - A foreign key is used to make a row of data from one table to a row of data in another. The users table doesn't have a foreign key. However, the pictures table has foreign key 'user_id.' This foreign key is used to match a picture to a user in the users table. The user_id is matched to id in the users table.  
```
CREATE TABLE users (
    id SERIAL PRIMARY KEY, 
    name VARCHAR NOT NULL,
    address VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    age INT 
);
CREATE TABLE pictures (
    id SERIAL PRIMARY KEY,
    url VARCHAR NOT NULL,
    user_id INT NOT NULL
);
```

- Insert rows of data into users table
```
INSERT INTO TABLE users(name, address, email, age) VALUES("Stephanie", "1234 st El Paso TX", "stephanie@gmail.com", 20); -- will have id 1
INSERT INTO TABLE users(name, address, email, age) VALUES("Tanya", "1234 st El Paso TX", "tanya@gmail.com", 22); -- will have id 2
```

- Insert rows of data into pictures table
```
INSERT INTO TABLE pictures(url, user_id) VALUES('fake_url', 1); -- this picture belongs to Stephanie (ID 1)
INSERT INTO TABLE pictures(url, user_id) VALUES('fake_url_2', 2); -- this picture belong to Tanya (ID 2)
```

- Viewing data. We can select from 1 to all colums in a table to view
    - selecting all columns
    ```
    SELECT * FROM users;
    ```
    - select name and age columns. 
    ```
    SELECT name, age FROM users;
    ```
- We can also filter which rows show up when viewing data
    - selecting rows in which email is equal to stephanie@gmail.com. We can do this using WHERE.
        - Example 1
        ```
        SELECT * FROM users WHERE email='stephanie@gmail.com';
        ```
        - Example 2
        ```
        SELECT name FROM users WHERE email='stephanie@gmail.com';
        ```
- You can alias columns you select. This would be helpful if you're trying to create a new table off an existing table
```
SELECT name AS full_name, age, email FROM users;
```

- we can remove all data in a table without deleting the table by using TRUNCATE TABLE
```
TRUNCATE TABLE users;
```

- we can also delete the table from our database using DROP TABLE
```
DROP TABLE users;
```

- we can also delete certain rows in a table 


- Kinds of relations between tables
    - One to Many
        - a row in a table can be associated to many rows in a second table
        - considering our current example, a user can have many pictures, but a single picture cannot have many users.
    - One to One
        - Let's alter our example. Let's say our pictures table is actually a table of profile pictures. A user can only have one profile picture, and one profile picture can only have one user. 
    - Many to Many
        - Let's alter our example again. Let's assume that these are now pictures on facebook that have users tagged. A user can have many pictures they are tagged in, and a picture can have many tagged users. 













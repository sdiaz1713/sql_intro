# Intro to SQL and Postgres
- Installing postgres on Mac
    - Download [postgresapp](https://postgresapp.com/)
    - Move postgresapp to Applications folder
    - add path to bash profile
        ```
        open ~/.bash_profile
        ```
        - add the line below
        ```
        export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/11/bin
        ```
        ```
        source ~/.bash_profile
        psql
        ```

- Useful psql commands
    - view all databases
    ```
    \l
    ```
    - connect to database 
    ```
    \c database_name
    ```
    - exiting psql
    ```
    \q
    ```
    - viewing all tables in a database
    ```
    \d+
    ```
    - viewing detailed info on a table
    ```
    \d+ table_name
    ```
- let's start by creating a database named learning_database
```
CREATE DATABASE learning_database;
```

- let's create a users table and pictures table
    - End all sql statements with ';' to let postgres know you are done with a statement.
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
    user_id INT NOT NULL, 
    FOREIGN KEY (user_id) REFERENCES users (id)
);
```

- Insert rows of data into users table
    - Note: use single quotes in any string values, otherwise postgres will think they are column names
```
INSERT INTO users(name, address, email, age) VALUES('Stephanie', '1234 st El Paso TX', 'stephanie@gmail.com', 20); -- will have id 1
INSERT INTO users(name, address, email, age) VALUES('Tanya', '1234 st El Paso TX', 'tanya@gmail.com', 22); -- will have id 2
```

- Insert rows of data into pictures table
```
INSERT INTO pictures(url, user_id) VALUES('fake_url', 1); -- this picture belongs to Stephanie (ID 1)
INSERT INTO pictures(url, user_id) VALUES('fake_url_2', 2); -- this picture belong to Tanya (ID 2)
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
```
DELETE FROM users WHERE name='Stephanie'
```

- modify rows in a database using UPDATE
```
UPDATE users SET email='stephanie_diaz@gmail.com' WHERE name='Stephanie';
```


- Kinds of relations between tables (checkout pdf for visualization of these relations)
- Note: Many to Many will come in a future lesson
    - One to Many
        - a row in a table can be associated to many rows in a second table
        - considering our current example, a user can have many pictures, but a single picture cannot have many users.
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
            user_id INT NOT NULL, 
            FOREIGN KEY (user_id) REFERENCES users(id)
        );
        ```
    - One to One
        - Let's alter our example. Let's say our pictures table is actually a table of profile pictures. A user can only have one profile picture, and one profile picture can only have one user. 
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
            user_id INT NOT NULL UNIQUE, 
            FOREIGN KEY (user_id) REFERENCES users(id)
        );
        ```

## Deliverables (write in deliverables.sql)
- create a database
- create a system of tables in the database that includes all relationships
- write the following queries
    - insert data rows into all tables (a separate query for each table)
    - a query that deletes a specific row in any table based on a critera (you can decide on this criteria)
    - a query that modifies a row in any table
    - a query that finds a row based on a foreign key for each of the relations
    - a query that returns the columns of a table aliased (you can chose the aliases)












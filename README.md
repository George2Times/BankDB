# BankDatabaseProject

This project contains the SQL scripts to create and manage a comprehensive banking database.

## Features
- **Tables:** Customers, Accounts, Transactions
- **Stored Procedures:** TransferFunds
- **Triggers:** ValidateWithdrawal
- **Views:** AccountSummary
- **Seed Data:** Sample customers and accounts

## Structure
- `docs/`: Documentation and ERD diagrams.
- `sql/schema/`: Database schema definitions.
- `sql/seed/`: Sample data.
- `sql/procedures/`: Stored procedures.
- `sql/views/`: SQL views.
- `sql/triggers/`: Database triggers.
- `tests/`: Test queries.

## How to Set Up and Run the Project

### Step 1: Install MySQL Server
1. Download and install MySQL Community Edition from [MySQL Downloads](https://dev.mysql.com/downloads/).
2. Set up a MySQL root user with a password.
3. Start MySQL server and ensure it is running.

### Step 2: Create the Database
1. Open MySQL Workbench or MySQL CLI.
2. Run the following command to create the database:
   ```sql
   CREATE DATABASE BankDB;
   USE BankDB;
   ```

### Step 3: Import Database Schema
Run the following scripts in order:
1. Import the schema scripts from `sql/schema/`:
   ```sql
   SOURCE path/to/sql/schema/customers.sql;
   SOURCE path/to/sql/schema/accounts.sql;
   SOURCE path/to/sql/schema/transactions.sql;
   ```

### Step 4: Load Seed Data
To populate the database with sample data:
```sql
SOURCE path/to/sql/seed/customers_seed.sql;
SOURCE path/to/sql/seed/accounts_seed.sql;
```

### Step 5: Add Stored Procedures, Views, and Triggers
1. Import procedures:
   ```sql
   SOURCE path/to/sql/procedures/transfer_funds.sql;
   ```
2. Import views:
   ```sql
   SOURCE path/to/sql/views/account_summary.sql;
   ```
3. Import triggers:
   ```sql
   SOURCE path/to/sql/triggers/validate_withdrawal.sql;
   ```

### Step 6: Run Tests
To verify that everything works correctly:
```sql
SOURCE path/to/tests/test_queries.sql;
```

## Test Cases

### 1. Verify Table Data
```sql
SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Transactions;
```

### 2. Test Stored Procedure (Fund Transfer)
```sql
CALL TransferFunds(1, 2, 200.00);
SELECT * FROM Accounts WHERE AccountID IN (1, 2);
SELECT * FROM Transactions WHERE AccountID IN (1, 2);
```

### 3. Test Trigger (Withdrawal Validation)
```sql
UPDATE Accounts SET Balance = -100 WHERE AccountID = 1;
```
Expected: Should return an error due to insufficient funds.

### 4. Test Views
```sql
SELECT * FROM AccountSummary;
```

## Possible Enhancements
### 🔧 Additional Features to Implement
- **More Stored Procedures**
  - `CalculateInterest()`: Apply interest to savings accounts.
  - `MonthlyStatement()`: Generate a report for each account.
- **Additional Triggers**
  - Prevent duplicate transactions.
  - Log all account updates.
- **Enhanced Security**
  - Implement **role-based access control (RBAC)**.
  - Encrypt sensitive customer data.
- **Integrate with an API**
  - Use Python or Node.js to build a REST API for banking operations.

## ERD
TODO
<!-- ![ERD Diagram](docs/ERD.png) -->

## Contributing
If you'd like to contribute to this project, feel free to fork the repository, create a branch, and submit a pull request.

## License
This project is licensed under the MIT License.



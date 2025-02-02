-- Test Customers table
SELECT * FROM Customers;

-- Test Accounts table
SELECT * FROM Accounts;

-- Test Transactions table
SELECT * FROM Transactions;

-- Test procedure TransferFunds
CALL TransferFunds(1, 2, 200.00);

-- Test view AccountSummary
SELECT * FROM AccountSummary;

-- Test trigger ValidateWithdrawal
UPDATE Accounts SET Balance = -100 WHERE AccountID = 1;

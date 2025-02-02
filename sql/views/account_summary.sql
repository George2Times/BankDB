CREATE VIEW AccountSummary AS
SELECT
    a.AccountID,
    c.FirstName,
    c.LastName,
    a.AccountType,
    a.Balance
FROM Accounts a
JOIN Customers c ON a.CustomerID = c.CustomerID;

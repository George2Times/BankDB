CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    AccountID INT NOT NULL,
    Amount DECIMAL(15, 2) NOT NULL,
    TransactionDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    TransactionType ENUM('Deposit', 'Withdrawal', 'Transfer') NOT NULL,
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

CREATE DEFINER=`root`@`localhost` PROCEDURE `TransferFunds`(
    IN senderAccountID INT,
    IN receiverAccountID INT,
    IN transferAmount DECIMAL(15, 2)
)
BEGIN
    -- Sprawdzenie, czy nadawca ma wystarczające saldo
    DECLARE senderBalance DECIMAL(15,2);
    
    SELECT Balance INTO senderBalance 
    FROM Accounts 
    WHERE AccountID = senderAccountID;

    IF senderBalance < transferAmount THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Insufficient funds!';
    ELSE
        -- Rozpoczęcie transakcji
        START TRANSACTION;

        -- Aktualizacja salda konta nadawcy
        UPDATE Accounts 
        SET Balance = Balance - transferAmount 
        WHERE AccountID = senderAccountID;

        -- Aktualizacja salda konta odbiorcy
        UPDATE Accounts 
        SET Balance = Balance + transferAmount 
        WHERE AccountID = receiverAccountID;

        -- Dodanie transakcji do tabeli Transactions (dla nadawcy)
        INSERT INTO Transactions (AccountID, Amount, TransactionType)
        VALUES (senderAccountID, -transferAmount, 'Transfer');

        -- Dodanie transakcji do tabeli Transactions (dla odbiorcy)
        INSERT INTO Transactions (AccountID, Amount, TransactionType)
        VALUES (receiverAccountID, transferAmount, 'Transfer');

        -- Zatwierdzenie transakcji
        COMMIT;
    END IF;
END
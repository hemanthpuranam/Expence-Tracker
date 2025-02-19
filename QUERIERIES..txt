To Retrieve all distint transactions

SELECT DISTINCT T_Type FROM Transaction;

----------------------------
to RETRIVE USER PROFILE ALONG WITH ACCOUNT TYPE

SELECT U.U_Name, AT.A_Type
FROM User_Profile U
INNER JOIN Account A ON U.U_ID = A.U_ID
INNER JOIN Account_Type AT ON A.Type_ID = AT.Type_ID;


------------------------------

Create a view to display all active accounts:

CREATE VIEW Active_Accounts AS
SELECT * FROM Account WHERE A_Status = 'ACTIVE';


------------------------------
Update Account Balance using Triggers:

CREATE OR REPLACE TRIGGER update_balance
AFTER INSERT ON Transaction
FOR EACH ROW
BEGIN
    IF :NEW.T_Type = 'Income' THEN
        UPDATE Account
        SET A_BALANCE = A_BALANCE + :NEW.T_Amount
        WHERE A_Number = :NEW.A_Number;
    ELSIF :NEW.T_Type = 'Expense' THEN
        UPDATE Account
        SET A_BALANCE = A_BALANCE - :NEW.T_Amount
        WHERE A_Number = :NEW.A_Number;
    -- Handle other transaction types as needed
    END IF;
END;


Trigger for Inserting into Transaction Table: This trigger calculates the account balance after each transaction and updates the balance in the Account table.

CREATE OR REPLACE TRIGGER update_account_balance
AFTER INSERT ON Transaction
FOR EACH ROW
DECLARE
    v_balance NUMBER;
BEGIN
    SELECT SUM(T_Amount)
    INTO v_balance
    FROM Transaction
    WHERE A_Number = :NEW.A_Number;

    UPDATE Account
    SET A_Balance = v_balance
    WHERE A_Number = :NEW.A_Number;
END;
/

Trigger for Logging Loan Activities: This trigger logs loan-related activities such as disbursement and payments into a separate table for audit purposes.

CREATE OR REPLACE TRIGGER loan_activity_log_1
AFTER INSERT OR UPDATE ON Loan
FOR EACH ROW
DECLARE
    v_action VARCHAR2(100);
BEGIN
    IF INSERTING THEN
        v_action := 'Loan Disbursed';
    ELSIF UPDATING THEN
        v_action := 'EMI Payment';
    END IF;

    INSERT INTO Loan_Log (L_ID, Action_Type, Action_Date)
    VALUES (:NEW.L_ID, v_action, SYSDATE);
END;
/

---------------------------------
Cursor to Calculate Total Expenses for a Specific Account:

CREATE OR REPLACE PROCEDURE calculate_total_expenses (account_id IN NUMBER)
IS
    total_expense NUMBER;
    CURSOR expense_cursor IS
        SELECT T_Amount
        FROM Transaction
        WHERE A_Number = account_id
        AND T_Type = 'Expense';
BEGIN
    total_expense := 0;
    FOR expense_rec IN expense_cursor LOOP
        total_expense := total_expense + expense_rec.T_Amount;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Total Expenses for Account ' || account_id || ': ' || total_expense);
END;
/



Cursor to Fetch Loan Details for a Specific Account:

CREATE OR REPLACE PROCEDURE fetch_loan_details (account_id IN NUMBER)
IS
    v_loan_amount NUMBER;
    v_loan_tenure NUMBER;
    v_loan_interest_rate NUMBER;
    CURSOR loan_cursor IS
        SELECT L_amount, L_tenure, Interest_Rate
        FROM Loan
        WHERE A_Number = account_id;
BEGIN
    OPEN loan_cursor;
    FETCH loan_cursor INTO v_loan_amount, v_loan_tenure, v_loan_interest_rate;
    CLOSE loan_cursor;

    DBMS_OUTPUT.PUT_LINE('Loan Amount: ' || v_loan_amount);
    DBMS_OUTPUT.PUT_LINE('Loan Tenure: ' || v_loan_tenure);
    DBMS_OUTPUT.PUT_LINE('Interest Rate: ' || v_loan_interest_rate);
END;
/

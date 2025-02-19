 INSERT INTO User_Profile (U_ID, U_Name, U_Number, U_Email) VALUES
    (1, 'HEMANTH', 1001, 'hemanthprasad46@gmail.com') ;

---------------------------------------------------------------------------------------------



 INSERT INTO Account_Type (Type_ID, A_Type)
    VALUES
    (1, 'Savings');
 INSERT INTO Account_Type (Type_ID, A_Type)
    VALUES
    (2, 'SALARY');
------------------------------------------------------------------------------------------------
INSERT INTO T_Category (Category_ID, Category_Name) VALUES
(1, 'Groceries');
INSERT INTO T_Category (Category_ID, Category_Name) VALUES
    (2, 'FOOD');
INSERT INTO T_Category (Category_ID, Category_Name) VALUES
    (3, 'Utility Bills');
INSERT INTO T_Category (Category_ID, Category_Name) VALUES
   (4, 'Transport');
INSERT INTO T_Category (Category_ID, Category_Name) VALUES
    (5, 'Personal Care');
INSERT INTO T_Category (Category_ID, Category_Name) VALUES
    (6, 'Shopping');
INSERT INTO T_Category (Category_ID, Category_Name) VALUES
    (7, 'Transfer');

-----------------------------------------------------------------------------------

INSERT INTO Account (A_Number, U_ID, Type_ID, A_OPENdate, A_Status)
    VALUES (50001, 1, 1, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'ACTIVE');

INSERT INTO Account (A_Number, U_ID, Type_ID, A_OPENdate, A_Status)
    VALUES (50002, 1, 1, TO_DATE('2024-03-02', 'YYYY-MM-DD'), 'ACTIVE');


 -----------------------------------------------------------------------------------------

INSERT INTO Loan (L_ID, A_Number, L_amount, L_tenure, Down_Payment, Due_Date, EMI_amount, Interest_Rate, L_Sanction_Date,L_Start_Date)VALUES 
           (2001, 50001, 10000, 12, 2000, TO_DATE('2023-04-01', 'YYYY-MM-DD'), 1000, 5.5, TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2023-02-01', 'YYYY-MM-DD'));

--------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Transaction (T_ID, A_Number, T_date, T_Medium, T_Amount, T_Type, T_Description, Category_ID)
    VALUES
    (1001, 50001, TO_DATE('02-03-2024', 'DD-MM-YYYY'), 'Online', 1500, 'Expense', 'RelianceMart', 1);

INSERT INTO Transaction (T_ID, A_Number, T_date, T_Medium, T_Amount, T_Type, T_Description, Category_ID) 
VALUES
(1002, 50001, TO_DATE('03-03-2024', 'DD-MM-YYYY'), 'Online', 500, 'Expense', 'SpiceKitchen', 2);

INSERT INTO Transaction (T_ID, A_Number, T_date, T_Medium, T_Amount, T_Type, T_Description, Category_ID)
    VALUES
    (1003, 50001, TO_DATE('03-03-2024', 'DD-MM-YYYY'), 'Online', 890, 'Expense', 'Electricity', 3);

INSERT INTO Transaction (T_ID, A_Number, T_date, T_Medium, T_Amount, T_Type, T_Description, Category_ID) 
VALUES
(1004, 50001, TO_DATE('04-03-2024', 'DD-MM-YYYY'), 'Online', 120, 'Expense', 'Auto', 4);

INSERT INTO Transaction (T_ID, A_Number, T_date, T_Medium, T_Amount, T_Type, T_Description, Category_ID) 
VALUES
(1005, 50001, TO_DATE('04-03-2024', 'DD-MM-YYYY'), 'Online', 470, 'Expense', 'Serum', 5);


INSERT INTO Transaction (T_ID, A_Number, T_date, T_Medium, T_Amount, T_Type, T_Description, Category_ID) 
VALUES
(1006, 50001, TO_DATE('05-03-2024', 'DD-MM-YYYY'), 'Online', 1480, 'Expense', 'Pantaloons', 6);

INSERT INTO Transaction (T_ID, A_Number, T_date, T_Medium, T_Amount, T_Type, T_Description, Category_ID) 
VALUES
(1007, 50002, TO_DATE('06-03-2024', 'DD-MM-YYYY'), 'Online', 900, 'Expense', 'DMart', 1);

INSERT INTO Transaction (T_ID, A_Number, T_date, T_Medium, T_Amount, T_Type, T_Description, Category_ID) 
VALUES
(1008, 50002, TO_DATE('06-03-2024', 'DD-MM-YYYY'), 'Online', 500, 'Expense', 'Dhabha', 2);

INSERT INTO Transaction (T_ID, A_Number, T_date, T_Medium, T_Amount, T_Type, T_Description, Category_ID) 
VALUES
(1009, 50001, TO_DATE('07-03-2024', 'DD-MM-YYYY'), 'Online', 690, 'Expense', 'Internet', 3);

INSERT INTO Transaction (T_ID, A_Number, T_date, T_Medium, T_Amount, T_Type, T_Description, Category_ID) 
VALUES
(1010, 50001, TO_DATE('07-03-2024', 'DD-MM-YYYY'), 'Online', 120, 'Expense', 'Auto', 4);

INSERT INTO Transaction (T_ID, A_Number, T_date, T_Medium, T_Amount, T_Type, T_Description, Category_ID) 
VALUES
(1011, 50002, TO_DATE('08-03-2024', 'DD-MM-YYYY'), 'Online', 350, 'Expense', 'Exfoliator', 5);

INSERT INTO Transaction (T_ID, A_Number, T_date, T_Medium, T_Amount, T_Type, T_Description, Category_ID) 
VALUES
(1012, 50002, TO_DATE('08-03-2024', 'DD-MM-YYYY'), 'Online', 1300, 'Expense', '', 6);

INSERT INTO Transaction (T_ID, A_Number, T_date, T_Medium, T_Amount, T_Type, T_Description, Category_ID) 
VALUES
(1013, 50001,TO_DATE('08-03-2024', 'DD-MM-YYYY'), 'Online', 20000, 'Income', 'Self_AC_Transfer', 7);



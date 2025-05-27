-- Sample query to retrieve user information and account information using UNION
SELECT U_ID, U_Name, U_Number AS Identifier, U_Email AS Contact_Info, NULL AS A_Number, NULL AS A_Status, NULL AS Type_ID, NULL AS A_OPENdate
FROM User_Profile
UNION
SELECT A_Number AS U_ID, NULL AS U_Name, NULL AS Identifier, NULL AS Contact_Info, A_Number, A_Status, Type_ID, A_OPENdate
FROM Account;


-- Sample query to retrieve user information and account information using UNION
SELECT U_ID, U_Name, U_Number AS Identifier, U_Email AS Contact_Info, NULL AS A_Number, NULL AS A_Status, NULL AS Type_ID, NULL AS A_OPENdate
FROM User_Profile
UNION
SELECT A_Number AS U_ID, NULL AS U_Name, NULL AS Identifier, NULL AS Contact_Info, A_Number, A_Status, Type_ID, A_OPENdate
FROM Account;





CREATE VIEW User_Account_Infor AS
SELECT 
    UP.U_ID,
    UP.U_Name,
    UP.U_Number,
    UP.U_Email,
    A.A_Number,
    A.A_OPENdate,
    A.A_Status,
    AT.A_Type AS Account_Type
FROM 
    User_Profile UP
JOIN 
    Account A ON UP.U_ID = A.U_ID
JOIN 
    Account_Type AT ON A.Type_ID = AT.Type_ID;
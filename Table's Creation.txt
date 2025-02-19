CREATE TABLE User_Profile (
    U_ID INT NOT NULL PRIMARY KEY,
    U_Name VARCHAR(45) NOT NULL,
    U_Number INT NOT NULL UNIQUE,
    U_Email VARCHAR(45) NOT NULL UNIQUE
);



CREATE TABLE Account_2 (
    A_Number INT NOT NULL PRIMARY KEY,
    U_ID INT NOT NULL,
    Type_ID INT NOT NULL,
    A_OPENdate DATE NOT NULL,
    A_Status VARCHAR(6) NOT NULL,
    FOREIGN KEY (U_ID) REFERENCES User_Profile(U_ID),
    FOREIGN KEY (Type_ID) REFERENCES Account_Type(Type_ID)
);

CREATE TABLE Account_Details (
    A_Number INT NOT NULL PRIMARY KEY,
    U_ID INT NOT NULL,
    Type_ID INT NOT NULL,
    A_Type VARCHAR(15) NOT NULL,
    A_OPENdate DATE NOT NULL,
    A_Status VARCHAR(6) NOT NULL,
    FOREIGN KEY (U_ID) REFERENCES User_Profile(U_ID),
    FOREIGN KEY (Type_ID) REFERENCES Account_Type(Type_ID)
);

CREATE TABLE Account_Type (
    Type_ID INT NOT NULL PRIMARY KEY,
    A_Type VARCHAR(15) NOT NULL,
);

CREATE TABLE Transaction (
    T_ID INT NOT NULL PRIMARY KEY,
    A_Number INT NOT NULL,
    T_date DATE NOT NULL,
    T_Medium VARCHAR(15) NOT NULL,
    T_Amount INT NOT NULL,
    T_Type VARCHAR(15) NOT NULL,
    T_Description VARCHAR(200),
    Category_ID INT NOT NULL,
    FOREIGN KEY (A_Number) REFERENCES Account(A_Number),
    FOREIGN KEY (Category_ID) REFERENCES T_Category(Category_ID)
);

CREATE TABLE Transaction_Details (
    T_ID INT NOT NULL PRIMARY KEY,
    A_Number INT NOT NULL,
    T_date DATE NOT NULL,
    T_Amount INT NOT NULL,
    Category_ID INT NOT NULL,
    FOREIGN KEY (T_ID) REFERENCES Transaction(T_ID),
    FOREIGN KEY (Category_ID) REFERENCES T_Category(Category_ID)
);

CREATE TABLE Transaction_Type(
    T_ID INT NOT NULL PRIMARY KEY,
    T_Medium VARCHAR(15) NOT NULL,
    T_Type VARCHAR(15) NOT NULL,
    FOREIGN KEY (T_ID) REFERENCES Transaction(T_ID)
);





CREATE TABLE Loan (
    L_ID INT NOT NULL PRIMARY KEY,
    A_Number INT NOT NULL,
    L_amount INT NOT NULL,
    L_tenure INT NOT NULL,
    Down_Payment INT,
    Due_Date DATE NOT NULL,
    EMI_amount INT NOT NULL,
    Interest_Rate FLOAT NOT NULL,
    L_Sanction_Date DATE NOT NULL,
    L_Start_Date DATE NOT NULL,
    FOREIGN KEY (A_Number) REFERENCES Account(A_Number)
);



CREATE TABLE T_Category (
    Category_ID INT NOT NULL PRIMARY KEY,
    Category_Name VARCHAR(15) NOT NULL
);





CREATE TABLE Account_1 (
    A_Number INT NOT NULL PRIMARY KEY,
    U_ID INT NOT NULL,
    Type_ID INT NOT NULL,
    A_OPENdate DATE NOT NULL,
    A_Status VARCHAR(6) NOT NULL,
    FOREIGN KEY (U_ID) REFERENCES User_Profile(U_ID)
);
CREATE TABLE Loan_Payment_Details(
       Due_Date DATE NOT NULL,
       L_ID INT NOT NULL PRIMARY KEY,
       FOREIGN KEY (L_ID) REFERENCES Loan(L_ID)
);

CREATE TABLE Loan_Repayment_Details(
           EMI_amount INT NOT NULL,
           L_ID INT NOT NULL PRIMARY KEY,
       FOREIGN KEY (L_ID) REFERENCES Loan(L_ID)
);




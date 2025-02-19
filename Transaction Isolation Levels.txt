Transaction Isolation Levels
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;


START TRANSACTION;

UPDATE Account SET A_Status = 'Idle' WHERE A_Number = 50001;

SELECT * FROM Account WHERE A_Number = 50001;

COMMIT; 
-------------------------------------------------------------

Locking Mechanisms

START TRANSACTION;

SELECT * FROM Account WHERE A_Number = 50002 FOR UPDATE;

UPDATE Account SET A_Status = 'Active' WHERE A_Number = 50002;
SELECT * FROM Account WHERE A_Number = 50002;

COMMIT;
-------------------------------------------------------------------
Transaction Logging and Rollbacks

-- Procedure to update transaction amount and check limits
CREATE OR REPLACE PROCEDURE UpdateTransactionAmount(trans_id INT, new_amount DECIMAL)
IS
  v_amount DECIMAL(10,2);
BEGIN

  UPDATE Transaction
  SET T_Amount = new_amount
  WHERE T_ID = trans_id;

  SELECT T_Amount INTO v_amount FROM Transaction WHERE T_ID = trans_id;

  IF v_amount > 1000 THEN
    ROLLBACK;
  ELSE
    COMMIT;
  END IF;
END;
/


-- Call the procedure with parameters
CALL UpdateTransactionAmount(1003, 1500);


--------------------------------------------------------------------
backing up
mysqldump -u hemanth_5 -p awspassword tracker > backup-file.sql
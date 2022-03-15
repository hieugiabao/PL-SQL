-- test
SELECT * FROM PRODUCT_TYPE;

-- dual: Bảng ảo, có mặt tại mọi SCHEMA
SELECT * from DUAL;
SELECT 'Dual is special table in Oracle' AS Column_Title FROM DUAL;

-- tạo một sequence: đối tượng để tạo các số tăng dần
--Create a new Sequence

CREATE SEQUENCE MY_SEQUENCE
             START WITH 1 CACHE 20;
SELECT MY_SEQUENCE.Nextval FROM Dual;
SELECT MY_SEQUENCE.Currval FROM Dual;

-- Câu truy vấn QUERY
-- truy vấn toàn bộ dữ liệu
SELECT * FROM PRODUCT_TYPE;
-- =
SELECT Pty.* FROM PRODUCT_TYPE Pty;

SELECT Pty.NAME, Pty.PRODUCT_TYPE_CD FROM PRODUCT_TYPE Pty;

-- alias 
SELECT Emp.EMP_ID, Emp.FIRST_NAME, Emp.LAST_NAME, CONCAT('Employee', Emp.EMP_ID) || Emp.DEPT_ID AS Emp_No2 FROM EMPLOYEE Emp;

SELECT DISTINCT Pro.PRODUCT_TYPE_CD FROM PRODUCT Pro;

-- Câu lệnh này tìm kiếm các nhân viên bắt đầu vào làm việc trong 1 khoảng thời gian
-- xác định trong mệnh đề where.
-- 03-05-2002 ==> 09-08-2002  (Theo dd-MM-yyyy)
Select Emp.Emp_Id
     ,Emp.First_Name
     ,Emp.Last_Name
     ,Emp.Start_Date
     , -- To_Char là một hàm của Oracle.
      -- Không dùng cho DB khác.
      -- To_Char chuyển kiểu Date sang text
      -- Theo một định dạng nào đó ở đây là dd-MM-yyyy
      To_Char(Emp.Start_Date
             ,'dd-MM-yyyy') Start_Date_Vn
From   Employee Emp
Where
-- To_Date là một hàm của Oracle (Có thể ko có trên DB khác)
-- To_Date là hàm chuyển Text thành Date
-- Theo một định dạng nào đó, ở đây là dd-MM-yyyy.
( --
 Emp.Start_Date Between To_Date('03-05-2002'
                               ,'dd-MM-yyyy') And
 To_Date('09-08-2002'
        ,'dd-MM-yyyy') --
);

-- sort
SELECT Pro.PRODUCT_CD, Pro.PRODUCT_TYPE_CD, Pro.NAME
FROM PRODUCT Pro
Order by Pro.PRODUCT_TYPE_CD DESC,
       3 ASC;
       
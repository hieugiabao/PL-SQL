-- CREATE [OR REPLACE] PROCEDURE <procedure_name>
--           [
--            (argument1  [mode1]  datatype1,
--             argument2  [mode2]  datatype2,
--            ...)
--           ]
--      IS | AS
-- BEGIN
--    -- PL/SQL Block;
-- END;
-- procedure_name:  Tên thủ tục
-- argument:  Tên tham số
-- mode:  Loại tham số: IN hoặc OUT hoặc IN OUT, mặc định là IN
-- datatype:  Kiểu dữ liệu của tham số

Create Or Replace Procedure Get_Employee_Infos(
  p_Emp_Id In Number,
  v_First_Name Out Varchar2,
  v_Last_Name Out Varchar2,
  v_Dept_Id Out Number
) IS 
BEGIN
  SELECT Emp.First_Name, Emp.Last_Name, Emp.Dept_Id
  Into v_First_Name, v_Last_Name, v_Dept_Id
  From Employee Emp
  Where Emp.Emp_Id = p_Emp_Id;
EXCEPTION 
  When No_Data_Found Then
    Dbms_Output.Put_Line('No Record found with p_Emp_Id = ' || p_Emp_Id);
END Get_Employee_Infos;

-- use procedure Get_Employee_Infos
Declare
  p_Emp_Id Number := 2;
  v_First_Name Varchar2(50);
  v_Last_Name Varchar2(50);
  v_Dept_Id Number;
BEGIN
  Get_Employee_Infos (p_Emp_Id, v_First_Name, v_Last_Name, v_Dept_Id);

  dbms_output.PUT_LINE('First Name: ' || v_First_Name /*IN VARCHAR2*/);
  dbms_output.PUT_LINE('last Name: ' || v_Last_Name /*IN VARCHAR2*/);
  dbms_output.PUT_LINE('First Name: ' || v_Dept_Id /*IN VARCHAR2*/);
END;
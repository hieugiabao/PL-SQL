-- tinh tong 2 so a va b

DECLARE
  v_Result Number;
  v_a Number := 10;
  v_b Number := 20;

BEGIN
  DBMS_OUTPUT.PUT_LINE('v_a = ' || v_a /*IN VARCHAR2*/);
  DBMS_OUTPUT.PUT_LINE('v_b = ' || v_b /*IN VARCHAR2*/);
  v_Result := v_a + v_b;
  DBMS_OUTPUT.PUT_LINE('v_Result = ' || v_Result /*IN VARCHAR2*/);
END;

-- kiểu dữ liệu một cột
Declare 
  v_Emp_Id EMPLOYEE.EMP_ID%Type := 2;
  v_First_Name EMPLOYEE.FIRST_NAME%Type;
BEGIN
  Select Emp.First_Name
  Into v_First_Name
  From EMPLOYEE Emp
  Where Emp.Emp_Id = v_Emp_Id;

  Dbms_Output.Put_Line('v_First_Name = ' || v_First_Name);
EXCEPTION
  When No_Data_Found Then
    Dbms_Output.Put_Line('No data with id ' || v_Emp_Id);
  When Too_Many_Rows Then
    Dbms_Output.Put_Line('Khong the');
END;

-- kiểu dữ liệu một dòng 
DECLARE
  v_Emp_Id EMPLOYEE.EMP_ID%Type := 2;
  v_Emp Employee%RowType;
BEGIN
  Select * Into v_Emp From EMPLOYEE Emp 
  Where Emp.Emp_Id = v_Emp_Id;

  Dbms_Output.Put_Line('First name: ' || v_Emp.First_Name);
  Dbms_Output.Put_Line('Last name: ' || v_Emp.Last_Name);
EXCEPTION 
  When No_Data_Found Then 
    Dbms_Output.Put_Line('No data found');
END;



-- kiểu dữ liệu record

-- TYPE Ten_kieu_Record IS
--     RECORD  (
--             Col1  Kieu_Du_Lieu1  [NOT NULL{:=|DEFAULT} Bieu_Thuc],
--             Col2  Kieu_Du_Lieu2  [NOT NULL{:=|DEFAULT} Bieu_Thuc],
--              ...
--      );
Declare 
  v_Emp_Id EMPLOYEE.EMP_ID%Type := 1;
  Type Emp_Name_Type is Record (
    Emp_First_Name EMPLOYEE.First_Name%Type,
    Emp_Last_Name EMPLOYEE.Last_Name%Type,
    Emp_Full_Name Varchar2(50)
  );
  -- biến có kiểu là Emp_Name_Type
  v_Emp Emp_Name_Type;
BEGIN
  Select Emp.First_Name, 
         Emp.Last_Name, 
         Emp.First_Name || ' ' || Emp.Last_Name
  Into v_Emp
  From EMPLOYEE Emp
  Where Emp.Emp_Id = v_Emp_Id;

  Dbms_Output.Put_Line(' First_Name= ' || v_Emp.Emp_First_Name);
  Dbms_Output.Put_Line(' Last_Name= ' || v_Emp.Emp_Last_Name);
  Dbms_Output.Put_Line(' Full_Name= ' || v_Emp.Emp_Full_Name);

EXCEPTION
  When No_Data_Found Then
    Dbms_Output.Put_Line('No data with id ' || v_Emp_Id);
END;



-- kiểu dữ liệu table
-- TYPE  <Table_Name>
-- IS TABLE OF  <Data_Type>   [NOT NULL]
-- INDEX BY BINARY_INTEGER;
Declare 
  Type My_Table Is Table Of Varchar2(40)
  Index by BINARY_INTEGER;
  
  v_Emps My_Table;
  v_Check boolean;
  v_Index BINARY_INTEGER;
BEGIN
  v_Emps(1) := 'Mot';
  v_Emps(2) := 'Ba';
  v_Emps(3) := 'Nam';

  Dbms_Output.Put_Line('Element Count: ' || v_Emps.Count);

  For i In v_Emps.First .. v_Emps.Last Loop
    Dbms_Output.Put_Line('Element at ' || i || ' = ' || v_Emps(i));
  End Loop;

  -- kiểm tra xem có tồn tại phần tử thứ 100 hay không
  v_Check := v_Emps.exists(100);
  IF v_Check THEN
    Dbms_Output.Put_Line('Exist element at 100');
  Else 
    Dbms_Output.Put_Line('Not exsit element at 100');
  End If;

  -- xoa dữ liệu
  v_Emps.delete(3);
  
  v_Index := v_Emps.First;
  Loop 
    Dbms_Output.Put_Line('Element at ' || v_Index || ' is ' ||v_Emps(v_Index));
    Exit When v_Index = v_Emps.Last;
    v_Index := v_Emps.Next(v_Index);
  End Loop;
  Raise No_Data_Found;
EXCEPTION 
  When No_Data_Found Then
    Dbms_Output.Put_Line('The last element has been reached.');
END;


-- kiểu dữ liệu array
-- TYPE <varray_type_name>
-- IS VARRAY(n)
-- OF <element_type>;
Declare 
  Type Emp_Array Is Array(5) Of Varchar2(50);
  Type Salary_Array Is Array(5) Of Integer;

  v_Names Emp_Array;
  v_Salaries Salary_Array;
  v_Count Integer;
BEGIN
  -- Khởi tạo giá trị cho mảng
  v_Names := Emp_Array(
    'Nam',
    'Jone',
    'Tony',
    'Smith',
    'Blake'
  );
  v_Salaries := Salary_Array(
    1000,
    3000,
    10000,
    30000,
    1200
  );

  -- Số lượng phần tử
  v_Count := v_Names.Count;
  Dbms_Output.Put_Line('elememt count: ' || v_Count);

  For i In 1 .. v_Names.Count Loop
    Dbms_Output.Put_Line('Employee ' || v_Names(i) || ', Saraly ' || v_Salaries(i));
  End Loop;
END;
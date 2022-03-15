DECLARE
  v_Option Number := 1;
  v_Action Varchar2(20);

BEGIN
IF v_Option = 1 Then 
  v_Action := 'v_Option bang 1 day';
ELSIF v_Action = 2 Then
  v_Action := 'a khong, v_Option bang 2 co';
ELSIF v_Action = 3 Then
  v_Action := 'No bang 3 co ma';
ELSE
  v_Action := 'Khong biet bang bao nhieu';
End If;
DBMS_Output.PUT_LINE('Gia tri cuoi cung: ' || v_Action/*IN VARCHAR2*/);
End;

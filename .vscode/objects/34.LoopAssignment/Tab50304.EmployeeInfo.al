table 50304 EmployeeInfo
{
    Caption = 'EmployeeInfo';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; EmployeeID; Code[20])
        {
            Caption = 'Employee ID';
            Editable = true;
        }
        field(2; EmployeeName; Text[50])
        {
            Caption = 'Employee Name';
        }
        field(3; TotalLeaves; Integer)
        {
            Caption = 'Total Leaves';
        }
        field(4; LeavesTaken; Integer)
        {
            Caption = 'Leaves Taken';
        }
        field(5; AutoIncreaseNo; Integer)
        {
            Caption = 'AutoIncreaseNo';
        }
        field(6; RemainingLeaves; Integer)
        {
            Caption = 'Remaining Leaves';
            Editable = false;
        }
        field(7; LeavesCompleted; Boolean)
        {
            Caption = 'Leaves Completed';
            Editable = false;
        }
        field(8; EmployeeStatus; Boolean)
        {
            Caption = 'Processed';
            Editable = false;
        }
    }
    keys
    {
        key(PK; EmployeeID)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        NewAUtoIncrNo: Integer;
        EmployeeRecord: Record EmployeeInfo;
        NewEmployeeID: Code[20];
    begin
        if EmployeeRecord.FindLast() then begin
            NewAUtoIncrNo := EmployeeRecord.AutoIncreaseNo + 1;
        end else begin
            NewAUtoIncrNo := 1;
        end;
        Rec.AutoIncreaseNo := NewAUtoIncrNo;
        NewEmployeeID := 'EMP' + Format(NewAUtoIncrNo);
        Rec.EmployeeID := NewEmployeeID;
    end;
}

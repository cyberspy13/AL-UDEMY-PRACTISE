namespace ALUDEMYPRACTISE.ALUDEMYPRACTISE;

page 50305 "Employee 21 List"
{
    ApplicationArea = All;
    Caption = 'Employee 21 List';
    PageType = List;
    SourceTable = EmployeeInfo;
    UsageCategory = Lists;
    CardPageId = 50306; // EmployeePageCard
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(EmployeeID; Rec.EmployeeID)
                {
                    ToolTip = 'Specifies the value of the EmployeeID field.', Comment = '%';
                }
                field(EmployeeName; Rec.EmployeeName)
                {
                    ToolTip = 'Specifies the value of the EmployeeName field.', Comment = '%';
                }
                field(LeavesTaken; Rec.LeavesTaken)
                {
                    ToolTip = 'Specifies the value of the LeavesTaken field.', Comment = '%';
                }
                field(TotalLeaves; Rec.TotalLeaves)
                {
                    ToolTip = 'Specifies the value of the TotalLeaves field.', Comment = '%';
                }
                field(RemainingLeaves; Rec.RemainingLeaves)
                {
                    ToolTip = 'Specifies the value of the RemainingLeaves field.', Comment = '%';
                }
                field(LeavesCompleted; Rec.LeavesCompleted)
                {
                    ToolTip = 'Specifies the value of the LeavesCompleted field.', Comment = '%';
                }
                field(EmployeeStatus; Rec.EmployeeStatus)
                {
                    ToolTip = 'Specifies the value of the EmployeeStatus field.', Comment = '%';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(validateLeave)
            {
                Caption = 'Validate Leave';
                Image = Information;
                trigger OnAction()
                var
                    EmployeeRecord: Record EmployeeInfo;
                    IndividualEmployee: Code[20];
                begin
                    if EmployeeRecord.FindSet() then
                        repeat
                            if (EmployeeRecord.LeavesTaken <> 0) and (EmployeeRecord.TotalLeaves <> 0) then begin
                                EmployeeRecord.RemainingLeaves := EmployeeRecord.TotalLeaves - EmployeeRecord.LeavesTaken;
                                EmployeeRecord.Modify(true);
                            end;
                            if (EmployeeRecord.EmployeeStatus = false) then begin
                                if (EmployeeRecord.RemainingLeaves > 0) then begin
                                    EmployeeRecord.LeavesCompleted := true;
                                    EmployeeRecord.Modify(true);
                                    Message('Employee ID: %1 has Positive Leave Balance of %2', EmployeeRecord.EmployeeID, EmployeeRecord.RemainingLeaves);
                                end else if (EmployeeRecord.RemainingLeaves < 0) then begin
                                    Message('Employee ID: %1 has Negative Leave Balance of %2', EmployeeRecord.EmployeeID, EmployeeRecord.RemainingLeaves);
                                    EmployeeRecord.EmployeeStatus := true;
                                end else
                                    Message('Employee ID: %1 has Zero Leave Balance', EmployeeRecord.EmployeeID);
                            end;


                            EmployeeRecord.EmployeeStatus := true;
                            EmployeeRecord.Modify(true);
                        until EmployeeRecord.Next() = 0;
                end;
            }
        }
    }
}

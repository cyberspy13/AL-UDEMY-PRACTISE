namespace ALUDEMYPRACTISE.ALUDEMYPRACTISE;

page 50306 "Employee 21 Card"
{
    ApplicationArea = All;
    Caption = 'Employee 21 Card';
    PageType = Card;
    SourceTable = EmployeeInfo;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

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
            }
        }
    }
}

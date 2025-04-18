page 50303 "Armstrong No. Page Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Armstrong No Table";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    Caption = 'No';
                    ToolTip = 'Enter the number to check if it is an Armstrong number.';
                    Editable = false;
                    Visible = false;
                }
                field(ArmstrongNo; Rec.ArmstrongNo)
                {
                    ApplicationArea = All;
                    Caption = 'Armstrong No';
                    ToolTip = 'The Armstrong number is displayed here.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    ToolTip = 'Description of the Armstrong number.';
                    Editable = false;
                    Visible = false;
                }


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        ArmstrongNoCodeunit: Codeunit "ArmstrongNo Codeunit";
    begin
        //  ArmstrongNoCodeunit.CheckArmstrongNo(Rec);
    end;
}
page 50304 "Arstrong No. List"
{
    Caption = 'Armstrong No.';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Armstrong No Table";
    Editable = true;
    CardPageId = "Armstrong No. Page Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    Caption = 'No';
                    ToolTip = 'Enter the number to check if it is an Armstrong number.';
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
                }


            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Delete Table Records")
            {

                trigger OnAction()
                begin
                    Rec.DeleteAll();

                end;
            }
            action("Validate the Armstrong No.")
            {
                trigger OnAction()
                var
                    ArmstrongNoCodeunit: Codeunit "ArmstrongNo Codeunit";
                begin
                    ArmstrongNoCodeunit.ValidateArmstrongNo(Rec);
                end;
            }
        }
    }

    var
        myInt: Integer;
}
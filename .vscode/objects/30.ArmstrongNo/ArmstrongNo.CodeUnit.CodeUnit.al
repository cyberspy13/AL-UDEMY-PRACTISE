codeunit 50304 "ArmstrongNo Codeunit"
{
    procedure CheckArmstrongNo(var Rec: Record "Armstrong No Table")
    var
        NewNo: Integer;
    begin

        if Rec.FindLast() then begin
            NewNo := Rec.No + 1; // Increment the last found "No."
        end else begin
            NewNo := 1; // Start from 1 if no records exist
        end;
        Rec.Init();
        // Make sure to assign the new unique value
        Rec.No := NewNo;
    end;


}
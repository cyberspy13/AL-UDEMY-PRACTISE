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

    procedure ValidateArmstrongNo(var Rec: Record "Armstrong No Table")
    var
        ArmstrongNoList: List of [Integer];
        ArmstrongNoTextList: List of [Text];
        InputNo: Integer;
        Count: Integer;
        Sum: Integer;
        StringValue: Text[5];
        I: Integer;
        CurrentChar: Text[1]; // Variable to hold the current character
        InputInteger: Integer;

    begin

        InputNo := Rec.ArmstrongNo;
        StringValue := Format(InputNo); // Convert the number to a string
        Count := StrLen(StringValue);// Get the length of the number

        Clear(ArmstrongNoList); // Clear the list before use

        for I := 1 to Count do begin
            CurrentChar := StringValue[I]; // Get the character at position I - this is like a loop where I it is a position in the list 1-1/2-2/3/3
            // ArmstrongNoTextList.Add(CurrentChar); // Add the character to the list -this is working fine
            if Evaluate(InputInteger, CurrentChar) then; // Convert the character to an integer
            ArmstrongNoList.Add(InputInteger); // Add the integer to the list

        end;
    end;







}
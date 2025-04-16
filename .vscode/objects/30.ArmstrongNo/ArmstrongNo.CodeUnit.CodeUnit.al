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
        //ArmstrongNoArray: array of Integer;
        InputNo: Integer;
        Count: Integer;
        Sum: Integer;
        StringValue: Text[5];
        I: Integer;
        CurrentChar: Text[1]; // Variable to hold the current character
    begin

        InputNo := Rec.ArmstrongNo;
        StringValue := Format(InputNo); // Convert the number to a string
        Count := StrLen(StringValue);// Get the length of the number

        Clear(ArmstrongNoList); // Clear the list before use
        for I := 1 to Count do
            CurrentChar := StringValue[I]; // Get the character at position I
        if Evaluate(I, CurrentChar) then
            ArmstrongNoList.Add(I); // Convert the character to an integer and add it to the list   


    end;




    //     ArmstrongNoList.Add(Rec.No);
    //     Count := ArmstrongNoList.Count();

    //     if ArmstrongNoList.Count() > 0 then begin
    //         Sum := 
    //     end;
    // end;


}
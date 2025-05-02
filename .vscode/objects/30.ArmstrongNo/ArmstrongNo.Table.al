table 50303 "Armstrong No Table"
{
    DataClassification = ToBeClassified;
    Caption = 'Armstrong No';

    fields
    {
        field(1; No; Integer)
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            Editable = true;
            //AutoIncrement = true; - this can be alternative 
        }
        field(2; ArmstrongNo; Integer)
        {
            Caption = 'Armstrong No.';
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
        NewNo: Integer;
        ArmsRecord: Record "Armstrong No Table";
    begin
        if ArmsRecord.FindLast() then begin
            NewNo := ArmsRecord.No + 1;
        end else begin
            NewNo := 1;
        end;
        Rec.No := NewNo;
    end;








}
table 50302 "Statement Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'Statement No.';
            DataClassification = ToBeClassified;
        }
        field(2; Amount; Integer)
        {
            Caption = 'Total Purchase Amount';
            DataClassification = ToBeClassified;

        }
        field(3; Discount; Decimal)
        {
            Caption = 'Discount';
            DataClassification = ToBeClassified;
        }
        field(4; "Shipment Status"; Boolean)
        {
            Caption = 'Shipment Status';
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

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
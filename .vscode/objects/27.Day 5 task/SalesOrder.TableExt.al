tableextension 50303 "Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(50302; "Shipment Status"; Boolean)
        {
            Caption = 'Shipment Status';
            DataClassification = ToBeClassified;

            trigger OnValidate()

            begin
                if Rec."Shipment Status" = false then
                    Error('Shipment Status is completed and shipment has been shipped ')
                else
                    Error('You can not have this option enabled.Shipment Status is not completed and shipment has not been shipped ');

            end;
        }
    }
    procedure SetShipmentStatus()

    begin

        if Rec."Document Type" = "Document Type"::Order then begin

            if Rec."Completely Shipped" = true then
                Rec."Shipment Status" := true
            else
                Rec."Shipment Status" := false;
        end;
        Rec.Modify();

    end;

    var
        SalesHeader: Record "Sales Header";


}
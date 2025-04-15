pageextension 50302 "Sales Order Ext" extends "Sales Order"
{
    layout
    {
        addafter(Status)
        {
            field(ShipmentStatus; Rec."Shipment Status")
            {
                ApplicationArea = All;
                Caption = 'Shipment Status';
                ToolTip = 'Indicates whether the shipment is completed.';
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SetShipmentStatus();
    end;

}
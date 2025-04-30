namespace AdvaniaUK.ProcedureTest.Customisations;
using Microsoft.Purchases.Document;

pageextension 50303 DiscountPrice extends "Purchase Order Subform"
{
    layout
    {
        addafter("Unit Price (LCY)")
        {
            field("Discount Price"; Rec."Discount Price")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addlast(processing)
        {
            action("Calculate Discount")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    DiscountCodeunit: Codeunit "OnlineStoreDiscount";
                begin
                    DiscountCodeunit.CalculateTotalWithDiscount(Rec);
                end;
            }
        }
        addlast("&Line")
        {
            action("Calculate Discount 2")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    DiscountCodeunit: Codeunit "OnlineStoreDiscount";
                begin
                    DiscountCodeunit.CalculateTotalWithDiscount2();
                end;
            }
        }
    }

    var
        myInt: Integer;
}
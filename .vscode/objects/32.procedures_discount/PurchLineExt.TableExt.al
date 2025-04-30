namespace AdvaniaUK.ProcedureTest.Customisations;
using Microsoft.Purchases.Document;

tableextension 50304 DiscountPrice extends "Purchase Line"
{
    fields
    {
        field(50302; "Discount Price"; Decimal)
        {
            Caption = 'Discount Price';
            DataClassification = ToBeClassified;
            Editable = false;
        }

    }
}